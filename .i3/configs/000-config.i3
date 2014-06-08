#!/bin/cat
# vim:syntax=i3
set $mod Mod4

floating_modifier $mod
new_window 1pixel
hide_edge_borders both

# font for window titles. ISO 10646 = Unicode
font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
font pango:DejaVu Sans Mono, VL Gothic, Font Awesome, Arial Unicode MS, Apple Symbols 11px

bindsym $mod+Shift+o exec i3-input
