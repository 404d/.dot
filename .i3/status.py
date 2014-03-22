#!/usr/bin/python
# -*- encoding: utf-8 -*-
from __future__ import division
import json
from datetime import datetime
import time
import sys
import subprocess
import socket
import math
import os
import random

try:
    from nowplaying import nowplaying
except ImportError:
    nowplaying = None

sys.stdout.write('{"version":1}\n')
sys.stdout.flush()
sys.stdout.write('[\n')
sys.stdout.flush()
sys.stdout.write('[]\n')
sys.stdout.flush()

def getBatteries():
    batteryPath = "/sys/class/power_supply/"
    batteries = []
    if os.path.exists(batteryPath):
        for battery in os.listdir(batteryPath):
            batteries.append(os.path.join(batteryPath, battery))
    return batteries

batteries = getBatteries()
batteryData = []
vol = {}
nowPlaying = []
currTarget = None
audiocolor = "#000000"
ablaze = None
npLastScan = None

tick = 0
round = 0
while True:
    elements = []
    #Now Playing
    if nowplaying:
        color = "#FFFFFF"
        if tick == 4:
            round += 1
        if round <= 5:
            try:
                round = 0
                data = None
                if currTarget:
                    data = nowplaying.getData(*currTarget)
                if not data:
                    for target in nowplaying.targets:
                        if not data or data["PlayStatus"] != "Playing" and target != currTarget:
                            npTmpData = nowplaying.getData(*target)
                            if npTmpData:
                                data = npTmpData
                                currTarget = target
                if data is not None:
                    if data["PlayStatus"] != "Playing":
                        color = "#333333"
                        altcolor = "#666666"
                    else:
                        color = "#00A6B2"
                        altcolor = "#00FFFF"
                    nowPlaying = []
                    if "Season" in data:
                        nowPlaying.append({
                            "full_text": data["Show Title"],
                            "color": color,
                            "separator": False,
                            "separator_block_width": 5,
                        })
                        nowPlaying.append({
                            "full_text": "S",
                            "color": color,
                            "separator": False,
                            "separator_block_width": 0,
                        })
                        nowPlaying.append({
                            "full_text": "%02i" % int(data["Season"]),
                            "color": altcolor,
                            "separator": False,
                            "separator_block_width": 0,
                        })
                        nowPlaying.append({
                            "full_text": "E",
                            "color": color,
                            "separator": False,
                            "separator_block_width": 0,
                        })
                        nowPlaying.append({
                            "full_text": "%02i" % int(data["Episode"]),
                            "color": altcolor,
                        })
                    elif data["Type"] == "Audio":
                        nowPlaying.append({
                            "full_text": data["Title"],
                            "color": color,
                            "separator": False,
                            "separator_block_width": 5,
                        })
                        if "Artist" in data:
                            nowPlaying.append({
                                "full_text": "-",
                                "color": color,
                                "separator": False,
                                "separator_block_width": 5,
                            })
                            nowPlaying.append({
                                "full_text": data["Artist"],
                                "color": color,
                            })
                    if "Time" in data:
                        nowPlaying.append({
                            "full_text": "%(Time)s" % data,
                            "color": altcolor,
                            "separator": False,
                            "separator_block_width": 5,
                        })
                        if "Time" in data and "Percentage" in data and "Duration" in data:
                            totalBars = 20
                            totalpieces = int(100 / totalBars)
                            currBars = int(math.floor(int(data["Percentage"]) / totalpieces))
                            nowPlaying.append({
                                "full_text": "─" * (currBars - 1),
                                "color": altcolor,
                                "separator": False,
                                "separator_block_width": 0,
                            })
                            if currBars > 0:
                                nowPlaying.append({
                                    "full_text": "┤​",
                                    "color": altcolor,
                                    "separator": False,
                                    "separator_block_width": 0,
                                })
                            nowPlaying.append({
                                "full_text": "─" * (totalBars - currBars),
                                "color": color,
                                "separator": False,
                                "separator_block_width": 5,
                            })
                            nowPlaying.append({
                                "full_text": "%(Duration)s" % data,
                                "color": color,
                            })
                            nowPlaying.append({
                                "full_text": "%(Percentage)s%%" % data,
                                "color": color,
                                "align": "right",
                                "min_width": 24
                            })
                else:
                    nowPlaying = []
                    currTarget = None
            except:
                pass
            if len(nowPlaying) > 0:
                for el in nowPlaying:
                    elements.append(el)


    if tick == 0 and os.path.exists("/home/sl/.groundbreaker"):
        # Ablaze BG image from groundbreaker

        with open("/home/sl/.groundbreaker/postid", "r") as file:
            postid = file.read()
            file.close()
        with open("/home/sl/.groundbreaker/views", "r") as file:
            views = file.read()
            file.close()
        ablaze = {
            "full_text": "%s-%s" % (postid, views),
            "short_text": "%s" % postid,
            "color": "#FF6600"
        }
        """with open("/home/simen4000/.groundbreaker/sha1", "r") as file:
            views = file.read()
            file.close()
        elements.append({
            "full_text": "%s" % views,
            "short_text": "",
            "color": "#FF6600"
        })"""
    elements.append(ablaze)

    #Audio
    if tick in [0, 2, 4]:
        try:
            data = subprocess.Popen(["pacmd","list-sinks"], stdout=subprocess.PIPE)
            out, err = data.communicate()
            tmp = out.split("* index")
            tmpt = tmp[1].split("volume: 0:")
            if len(tmpt) > 1:
                tmp = tmpt[1].split("% 1:")
            else:
                tmpt = tmp[1].split("% /")
                tmp = [tmpt[0].split("/ ")[1]]
            if "muted: yes" in out:
                audiocolor = "#990000"
            else:
                audiocolor = "#0066FF"
        except:
            tmp = ["0"]
            audiocolor = "#990000"
    vol = {
        "full_text": "♪"+ tmp[0].strip() + "%",
        "color": audiocolor,
    }
    elements.append(vol)

    #Battery
    if tick <= 0:
        batteryData = []
        for battery in batteries:
            color = None
            if os.path.exists(os.path.join(battery, "status")):
                with open(os.path.join(battery, "status"), "r") as status_handle:
                    status = status_handle.read()
                    if "full" in status.lower():
                        color = "#00FF00"
                    elif "discharging" in status.lower():
                        color = "#333333"
                    elif "charging" in status.lower():
                        color = "#FF6600"
                    else:
                        color = "#FF0000"
                charge = 0
                try:
                    with open(os.path.join(battery, "charge_now"), "r") as charge_handle:
                        charge = int(charge_handle.read())
                except FileNotFoundError:
                    with open(os.path.join(battery, "energy_now"), "r") as charge_handle:
                        charge = int(charge_handle.read())
                max = 0
                try:
                    with open(os.path.join(battery, "charge_full"), "r") as charge_handle:
                        max = int(charge_handle.read())
                except FileNotFoundError:
                    with open(os.path.join(battery, "energy_full"), "r") as charge_handle:
                        max = int(charge_handle.read())
                percentage = (charge/max) * 100
                if percentage <= 20.0 and color == "#333333":
                    color = "#FF00000"
                batteryData.append({
                    "full_text": "%i%%" % percentage,
                    "color": color,
                    "min_width": 24,
                    "align": "right",
                })
            else:
                batteryData.append({
                    "full_text": "N/A",
                    "color": "#222222",
                })
    for d in batteryData:
        elements.append(d)


    #Load
    load = os.getloadavg()
    color = "#333333"
    if load[0] >= 8.0:
        color = "#FF0000"
    elif load[1] >= 8.0:
        color = "#CC3333"
    elif load[2] >= 8.0:
        color = "#9900D0"
    elif load[0] >= 4.0:
        color = "#FFFF00"
    elif load[1] >= 4.0:
        color = "#FFCC00"
    elif load[2] >= 4.0:
        color = "#996633"
    if load[0] == 4.2:
        disco = ["#FF0000","#FFFF00","#FF00FF","#00FFFF","#0000FF","#00FF00","#FF0099"]
        random.shuffle(disco)
        color = disco.pop()
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
        "full_text": socket.gethostname(),
        "color": "#aaaaaa",
    })

    sys.stdout.write(",%s\n" % json.dumps(elements))
    sys.stdout.flush()
    subprocess.call(["sleep", "0.2"])
    if tick >= 4:
        tick = 0
    else:
        tick += 1
