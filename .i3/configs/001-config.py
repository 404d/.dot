#!/usr/bin/python
import platform
import os
host = platform.node().lower()

if host == "yukiho":
    print """
# Host-specific configuration variables
set $screen_primary DVI-D-0
set $screen_primary HDMI-0
set $screen_primary VGA-0
"""

print """
set $basedir %s
""" % os.path.join(os.path.expanduser("~"), ".i3")

