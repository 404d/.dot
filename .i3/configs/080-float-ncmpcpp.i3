#!/bin/cat
for_window [title="^ncmpcpp (..._dev|d-.-b)"] floating enable
for_window [title="^ncmpcpp (..._dev|d-.-b)"] resize set 1080 px 490 px
for_window [title="^ncmpcpp (..._dev|d-.-b)"] move position center
bindsym $mod+n exec urxvt --title ncmpcpp' d-.-b' -e ncmpcpp
