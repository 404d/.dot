#!/bin/cat
# vim:syntax=i3
workspace 1 output $screen_primary
workspace 2 output $screen_primary
workspace 3 output $screen_primary
workspace 4 output $screen_primary
workspace 5 output $screen_secondary
workspace 6 output $screen_secondary
workspace 7 output $screen_secondary
workspace 8 output $screen_secondary
workspace 9 output $screen_auxiliary
workspace 10 output $screen_auxiliary

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10
bindsym $mod+F1 workspace 11
bindsym $mod+F2 workspace 12
bindsym $mod+F3 workspace 13
bindsym $mod+F4 workspace 14
bindsym $mod+F5 workspace 15
bindsym $mod+F6 workspace 16
bindsym $mod+F7 workspace 17
bindsym $mod+F8 workspace 18
bindsym $mod+F9 workspace 19
bindsym $mod+F10 workspace 20
bindsym $mod+F11 workspace 21
bindsym $mod+F12 workspace 22

# move focused container to workspace
# it should be possible to use numbers instead of key names here.
bindsym $mod+Shift+exclam move workspace 1
bindsym $mod+Shift+quotedbl move workspace 2
bindsym $mod+Shift+numbersign move workspace 3
bindsym $mod+Shift+currency move workspace 4
bindsym $mod+Shift+percent move workspace 5
bindsym $mod+Shift+ampersand move workspace 6
bindsym $mod+Shift+slash move workspace 7
bindsym $mod+Shift+parenleft move workspace 8
bindsym $mod+Shift+parenright move workspace 9
bindsym $mod+Shift+equal move workspace 10
bindsym $mod+Shift+F1 move workspace 11
bindsym $mod+Shift+F2 move workspace 12
bindsym $mod+Shift+F3 move workspace 13
bindsym $mod+Shift+F4 move workspace 14
bindsym $mod+Shift+F5 move workspace 15
bindsym $mod+Shift+F6 move workspace 16
bindsym $mod+Shift+F7 move workspace 17
bindsym $mod+Shift+F8 move workspace 18
bindsym $mod+Shift+F9 move workspace 19
bindsym $mod+Shift+F10 move workspace 20
bindsym $mod+Shift+F11 move workspace 21
bindsym $mod+Shift+F12 move workspace 22
