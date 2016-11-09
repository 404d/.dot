#!/usr/bin/zsh
hostname="$(echo $HOST | sed 's/\..*$//' | tr A-Z a-z)"
echo 'mode "xrandr" {
bindsym Escape mode "default"
bindsym Return mode "default"
'

if [[ x$hostname == "xyukiho" ]]; then
    cat <<HERE
bindsym s exec ~/.dot/bin/screen-manage single
bindsym w exec ~/.dot/bin/screen-manage single gamecorner
bindsym d exec ~/.dot/bin/screen-manage dual-hybel
bindsym e exec ~/.dot/bin/screen-manage dual-hybel gamecorner
bindsym t exec ~/.dot/bin/screen-manage triple
HERE
fi

echo '}
bindsym $mod+p mode "xrandr"'

