#!/usr/bin/python
import json
from datetime import datetime
import time
import sys
import subprocess
import socket
import os
import random


sys.stdout.write('{"version":1}\n')
sys.stdout.flush()
sys.stdout.write('[\n')
sys.stdout.flush()
sys.stdout.write('[]\n')
sys.stdout.flush()

while True:
    elements = []
    # Ablaze BG image from groundbreaker
    with open("/home/simen4000/.groundbreaker/postid", "r") as file:
        postid = file.read()
        file.close()
    with open("/home/simen4000/.groundbreaker/views", "r") as file:
        views = file.read()
        file.close()
    elements.append({
        "full_text": "Ablaze: %s (%s)" % (postid, views),
        "short_text": "%s" % postid,
        "color": "#FF6600"
    })

    #Load
    load = os.getloadavg()
    color = "#333333"
    if load[0] >= 1.0:
        color = "#FF0000"
    elif load[1] >= 1.0:
        color = "#CC3333"
    elif load[2] >= 1.0:
        color = "#9900D0"
    elif load[0] >= 0.5:
        color = "#FFFF00"
    elif load[1] >= 0.5:
        color = "#FFCC00"
    elif load[2] >= 0.5:
        color = "#996633"
    elements.append({
        "full_text": "%.2f %.2f %.2f" % load,
        "short_text": "%.2f" % load[0],
        "color": color,
    })

    # Date and Time
    now = datetime.now()
    time = "%02d:%02d:%02d" % (now.hour, now.minute, now.second)
    date = "%i-%02d-%02d %s" % (now.year, now.month, now.day, time)
    elements.append({
        "full_text": date,
        "short_text": time,
    })

    # Host
    elements.append({
        "full_text": socket.getfqdn(),
        "color": "#aaaaaa",
    })

    sys.stdout.write(",%s\n" % json.dumps(elements))
    sys.stdout.flush()
    subprocess.call(["sleep", "0.2"])
