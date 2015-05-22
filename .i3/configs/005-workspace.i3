#!/bin/cat
# vim:syntax=i3
workspace 1:一 output $screen_primary
workspace 2:二 output $screen_primary
workspace 3:三 output $screen_primary
workspace 4:四 output $screen_primary
workspace 5:五 output $screen_secondary
workspace 6:六 output $screen_secondary
workspace 7:七 output $screen_secondary
workspace 8:八 output $screen_secondary
workspace 9:九 output $screen_auxiliary
workspace 10:十 output $screen_auxiliary

# switch to workspace
bindsym $mod+1 workspace 1:一
bindsym $mod+2 workspace 2:二
bindsym $mod+3 workspace 3:三
bindsym $mod+4 workspace 4:四
bindsym $mod+5 workspace 5:五
bindsym $mod+6 workspace 6:六
bindsym $mod+7 workspace 7:七
bindsym $mod+8 workspace 8:八
bindsym $mod+9 workspace 9:九
bindsym $mod+0 workspace 10:十
bindsym $mod+F1 workspace 11:十一
bindsym $mod+F2 workspace 12:十二
bindsym $mod+F3 workspace 13:十三
bindsym $mod+F4 workspace 14:十四
bindsym $mod+F5 workspace 15:十五
bindsym $mod+F6 workspace 16:十六
bindsym $mod+F7 workspace 17:十七
bindsym $mod+F8 workspace 18:十八
bindsym $mod+F9 workspace 19:十九
bindsym $mod+F10 workspace 20:二十
bindsym $mod+F11 workspace 21:二十一
bindsym $mod+F12 workspace 22:二十二

# move focused container to workspace
# it should be possible to use numbers instead of key names here.
bindsym $mod+Shift+exclam move workspace 1:一
bindsym $mod+Shift+quotedbl move workspace 2:二
bindsym $mod+Shift+numbersign move workspace 3:三
bindsym $mod+Shift+currency move workspace 4:四
bindsym $mod+Shift+percent move workspace 5:五
bindsym $mod+Shift+ampersand move workspace 6:六
bindsym $mod+Shift+slash move workspace 7:七
bindsym $mod+Shift+parenleft move workspace 8:八
bindsym $mod+Shift+parenright move workspace 9:九
bindsym $mod+Shift+equal move workspace 10:十
bindsym $mod+Shift+F1 move workspace 11:十一
bindsym $mod+Shift+F2 move workspace 12:十二
bindsym $mod+Shift+F3 move workspace 13:十三
bindsym $mod+Shift+F4 move workspace 14:十四
bindsym $mod+Shift+F5 move workspace 15:十五
bindsym $mod+Shift+F6 move workspace 16:十六
bindsym $mod+Shift+F7 move workspace 17:十七
bindsym $mod+Shift+F8 move workspace 18:十八
bindsym $mod+Shift+F9 move workspace 19:十九
bindsym $mod+Shift+F10 move workspace 20:二十
bindsym $mod+Shift+F11 move workspace 21:二十一
bindsym $mod+Shift+F12 move workspace 22:二十二
