#!/bin/cat
# vim:syntax=i3
bindsym $mod+g exec groundbreaker
bindsym $mod+o exec xdg-open http://ablaze.apt.sexy/post/`cat /home/sl/.groundbreaker/postid` &>2
bindsym $mod+m exec curl http://ablaze.apt.sexy/api/media/$(cat ~/.groundbreaker/postid)/untag'?tag=wallpaper' && groundbreaker
