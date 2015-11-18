#!/usr/bin/zsh
echo 'mode "xrandr" {
bindsym Escape mode "default"
bindsym Return mode "default"
'

if [[ x$HOST == "xYukiho" ]]; then
    cat <<HERE
bindsym s exec ~/.dot/bin/screen-manage single
bindsym g exec ~/.dot/bin/screen-manage single gamecorner
bindsym t exec ~/.dot/bin/screen-manage triple
HERE
fi

echo '}
bindsym $mod+p mode "xrandr"'

