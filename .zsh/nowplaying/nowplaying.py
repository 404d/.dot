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
        return True
    except socket.error as e:
        return False

def getData(target,playertype="plex"):
    if playertype == "plex":
        return getData_Plex(target)
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


targets = [
        (("127.0.0.1", 6600), "mpd"),
        (("10.0.1.3", 6600), "mpd"),
        (("10.0.1.5", 6600), "mpd"),
        ("10.0.1.16", "plex"),
        ("10.0.1.3", "plex-jsonhttprpc"),
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
