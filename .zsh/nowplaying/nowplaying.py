import urllib
import xml.dom.minidom as xml
import json
import re
import socket


clients = {}


def isAvailable(address, port):
    # Create a TCP socket
    s = socket.socket()
    try:
        s.connect((address, port))
        s.settimeout(1.0)
        return True
    except socket.error as e:
        return False

def getData(target,playertype="plex"):
    if playertype == "plex":
        return getData_Plex(target)
    elif playertype == "plex-jsonhttprpc":
        return getData_XbmcJsonRpc(target)
    elif playertype == "mpd":
        return getData_Mpd(target)

rePlexParse = re.compile("^\<li\>([a-zA-Z])\:(.+)\n")
def getData_Plex(target):
    if isAvailable(target, 3000):
        html = urllib.urlopen("http://%s:3000/xbmcCmds/xbmcHttp?command=GetCurrentlyPlaying" % target).read()
        data = {}
        def getDataValue(key):
            tmp = re.search("\<li\>%s:(.+)\n" % key, html)
            if tmp:
                data[key] = tmp.group(1) 
        keys = [
            "Filename",
            "PlayStatus",
            "SongNo",
            "Type",
            "Title",
            "Track",
            "Artist",
            "Album",
            "URL",
            "Lyrics",
            "Samplerate",
            "Thumb",
            "Time",
            "Duration",
            "Percentage",
            "File size",
            "Changed",
            "Video",
            "Year",
            "Season",
            "Episode",
            "Plot",
            "Plotoutline",
            "Show Title",
            "VideoNo",
            ]
        for key in keys:
            getDataValue(key)
        if data["Filename"] == "[Nothing Playing]":
            return None
        return data
    else:
        return None

def getData_Mpd(target):
    if target in clients or isAvailable(*target):
        if target in clients:
            client = clients[target]
        else:
            from mpd import MPDClient
            client = MPDClient()
            client.timeout = 0.5
            client.idletimeout = None
            client.connect(*target)
            clients[target] = client
        status = client.status()
        if status['state'] not in ["play", "pause"]:
            return None
        result = {}
        def secondsToDuration(secs):
            minutes = secs // 60
            secs = secs % 60
            return "%02i:%02i" % (minutes, secs)
        time = int(status["time"].split(":")[0])
        duration = int(status["time"].split(":")[1])
        if status["state"] == "play":
            result["PlayStatus"] = "Playing"
        else:
            result["PlayStatus"] = "Paused"
        result["Time"] = secondsToDuration(time)
        result["Duration"] = secondsToDuration(duration)

        if float(duration > 0):
            result["Percentage"] = "%i" % ((time / float(duration)) * 100)
        playlist = client.playlistid(status["songid"])
        for i in ["album", "artist", "title"]:
            if i in playlist[0]:
                result[i.title()] = playlist[0][i]
        result["Type"] = "Audio"
        return result

def xbmcTimeToString(srcTime, srcTotal):
    format = "{minutes:02d}:{seconds:02d}"
    if srcTotal["hours"] > 0:
        format = "{hours:02d}:%s" % format
    return (format.format(**srcTime), format.format(**srcTotal))

def getData_XbmcJsonRpc(target):
    def call(payload):
        payload["jsonrpc"] = "2.0"
        data = jsonRpcRequest(target, 3005, payload)
        try:
            return data["result"]
        except KeyError:
            print data

    try:
        playerlist = call({"method": "Player.GetActivePlayers", "id": 1})
    except Exception:
        return None
    players = {}
    for player in playerlist:
        try:
            data = call({"method": "Player.GetProperties", "id": 1, "params": {"playerid": player["playerid"], "properties": ["percentage", "playlistid", "type", "time", "totaltime", "position", "speed"]}})

            results = {}
            info = {}

            if data["type"] == "video":
                info = call({"method": "Player.GetItem", "id": 1, "params": {"playerid": player["playerid"], "properties": ["showtitle", "episode", "season"]}})["item"]

                results["Type"] = "Video"
                if "showtitle" in info and info["showtitle"]:
                    results["Show Title"] = info["showtitle"].encode("utf-8")
                    results["Episode"] = info["episode"]
                    results["Season"] = info["season"]

            elif data["type"] == "audio":
                info = call({"method": "Player.GetItem", "id": 1, "params": {"playerid": player["playerid"], "properties": ["track", "artist", "originaltitle"]}})["item"]
                results["Type"] = "Audio"
                results["SongNo"] = info["track"]
                if "originaltitle" in info:
                    results["Artist"] = info["originaltitle"].encode("utf-8")
                else:
                    results["Artist"] = " ".join(info["artist"]).encode("utf-8")

            if data["speed"] == 1:
                results["PlayStatus"] = "Playing"
            elif data["speed"] == 0:
                results["PlayStatus"] = "Paused"
            elif data["speed"] > 0:
                results["PlayStatus"] = "Fast Forward"
            elif data["speed"] < 0:
                results["PlayStatus"] = "Rewind"
            results["Title"] = info["label"].encode("utf-8")
            results["Percentage"] = int(data["percentage"])
            time = xbmcTimeToString(data["time"], data["totaltime"])
            results["Time"] = time[0]
            results["Duration"] = time[1]
            return results
        except:
            pass




def jsonRpcRequest(host, port, method):
    import requests, json
    url = "http://%s:%s/jsonrpc" % (host, port)
    headers = {'content-type': 'application/json'}
    return requests.post(url, data=json.dumps(method), headers=headers, timeout=3.0).json()

targets = [
        ("10.0.1.5", "plex-jsonhttprpc"),
        ("10.0.1.3", "plex-jsonhttprpc"),
        ("10.0.2.14", "plex-jsonhttprpc"),
        ("10.0.10.12", "plex-jsonhttprpc"),
        ("10.0.1.16", "plex-jsonhttprpc"),
        (("127.0.0.1", 6600), "mpd"),
        (("10.0.1.3", 6600), "mpd"),
        (("10.0.1.5", 6600), "mpd"),
        ("10.0.1.16", "plex"),
        ("10.0.1.7", "plex"),
        ("10.0.1.32", "plex"),
        ("10.0.1.21", "plex"),
    ]

if __name__ == "__main__":
    data = None
    for (target, playertype) in targets:
        if data == None:
            data = getData(target, playertype=playertype)
    if data == None:
        print("{}")
    else:
        print(json.dumps(data))
