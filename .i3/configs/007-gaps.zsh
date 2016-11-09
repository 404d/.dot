#!/usr/bin/zsh
if (pacman -Qi i3-gaps-git || pacman -Qi i3-gaps) >/dev/null; then
    echo smart_gaps on
    echo gaps inner 20
    echo gaps outer 5
fi
