#!/usr/bin/env zsh
backlight="$1"
(GTK2_RC_FILES=~/.dot/yad/.gtkrc-2.0 yad --scale --value="$(cat $backlight/brightness)" --min-value=0 --max-value="$(cat $backlight/max_brightness)" --step="1" --print-partial --vertical --height=200 --button=gtk-ok:0 --mouse --on-top --skip-taskbar > $backlight/brightness --timeout 15 --timeout-indicator right --no-buttons --hide-value) &
