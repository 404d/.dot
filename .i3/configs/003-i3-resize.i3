#!/bin/cat
# vim:syntax=i3
# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # They resize the border in the direction you pressed, e.g.
        # when pressing left, the window is resized so that it has
        # more space on its left

bindsym j resize shrink left 10 px or 10 ppt
bindsym Shift+J resize grow   left 10 px or 10 ppt

bindsym k resize shrink down 10 px or 10 ppt
bindsym Shift+K resize grow   down 10 px or 10 ppt

bindsym l resize shrink up 10 px or 10 ppt
bindsym Shift+L resize grow   up 10 px or 10 ppt

bindsym oslash resize shrink right 10 px or 10 ppt
bindsym Shift+Oslash resize grow   right 10 px or 10 ppt

        # same bindings, but for the arrow keys
bindsym Left resize shrink left 10 px or 10 ppt
bindsym Shift+Left resize grow   left 10 px or 10 ppt

bindsym Down resize shrink down 10 px or 10 ppt
bindsym Shift+Down resize grow   down 10 px or 10 ppt

bindsym Up resize shrink up 10 px or 10 ppt
bindsym Shift+Up resize grow   up 10 px or 10 ppt

bindsym Right resize shrink right 10 px or 10 ppt
bindsym Shift+Right resize grow   right 10 px or 10 ppt

        # back to normal: Enter or Escape
bindsym Return mode "default"
bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"
