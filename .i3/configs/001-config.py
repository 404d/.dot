#!/usr/bin/python
import platform
import os
host = platform.node().lower()

if host == "yukiho":
    print("""
# Host-specific configuration variables
set $screen_primary DVI-D-0
set $screen_secondary HDMI-0
set $screen_auxiliary VGA-0
""")
elif host == "katsumi":
    print("""
# Host-specific configuration variables
set $screen_primary LVDS1
set $screen_secondary LVDS1
set $screen_auxiliary LVDS1
""")

print("""
set $basedir %s
""" % os.path.join(os.path.expanduser("~"), ".i3"))

