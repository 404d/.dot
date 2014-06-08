#!/bin/cat
# vim:filetype=i3
mode "xpra" {
    bindsym a mode "xpra attach"
    bindsym d mode "xpra detach "
    bindsym s mode "xpra start"
    bindsym c mode "xpra stop"
    bindsym u mode "xpra upgrade"
    bindsym v mode "xpra version"

    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+x mode "xpra"
