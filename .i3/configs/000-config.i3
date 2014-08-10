#!/bin/cat
# vim:syntax=i3
set $mod Mod4

floating_modifier $mod
new_window 1pixel
hide_edge_borders both

force_display_urgency_hint 1000 ms
workspace_auto_back_and_forth yes
mouse_warping none

# font for window titles. ISO 10646 = Unicode
font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
font pango:DejaVu Sans Mono, ProFont, VL Gothic, Font Awesome, Arial Unicode MS, Apple Symbols 11px

#client.focused          #859900 #859900 #fdf6e3 #2e9ef4
#client.focused_inactive #268bd2 #268bd2 #fdf6e3 #484e50
#client.unfocused        #333333 #93a1a1 #fdf6e3 #292d2e

bindsym $mod+Shift+o exec i3-input
