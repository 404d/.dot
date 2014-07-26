#!/usr/bin/env zsh
backlight=/sys/class/backlight/intel_backlight
(yad --scale --value="$(cat $backlight/brightness)" --min-value=0 --max-value="$(cat $backlight/max_brightness)" --step="1" --print-partial --vertical --height=200 --button=gtk-ok:0 --mouse --on-top --skip-taskbar > $backlight/brightness) &
