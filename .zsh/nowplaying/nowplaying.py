import urllib
import xml.dom.minidom as xml
import json
import re
import socket

def isAvailable(address, port):
    # Create a TCP socket
    s = socket.socket()
    try:
        s.connect((address, port))
        return True
    except socket.error, e:
        return False

def getData(target,playertype="plex"):
    if playertype == "plex":
        return getData_Plex(target)

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

targets = [
        ("10.0.1.7", "plex"),
        ("10.0.1.21", "plex"),
    ]

if __name__ == "__main__":
    data = None
    for (target, playertype) in targets:
        if data == None:
            data = getData(target, playertype=playertype)
    if data == None:
        print "{}"
    else:
        print json.dumps(data)
