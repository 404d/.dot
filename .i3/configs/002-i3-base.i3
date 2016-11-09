#!/bin/cat
# vim:syntax=i3
# reload the configuration file
bindsym $mod+Shift+C reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+R restart

# exit i3 (logs you out of your X session)
bindsym $mod+Shift+E exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# kill focused window
bindsym $mod+Shift+W kill

# start dmenu (a program launcher)
bindsym $mod+d exec rofi -show run || dmenu_run
bindsym $mod+shift+d exec i3-dmenu-desktop

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal
