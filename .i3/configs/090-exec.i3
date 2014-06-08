#!/bin/cat
# vim:syntax=i3
exec --no-startup-id dropbox &
exec --no-startup-id pulseaudio -D &
exec --no-startup-id xscreensaver &
exec --no-startup-id xautolock -locker 'zsh $basedir/bin/i3-locker.zsh' -time 10 -corners 0-00 &
exec --no-startup-id compton -cCzfbi 0.8 --mark-wmwin-focused --mark-ovredir-focused --vsync opengl --blur-background --blur-kern '5,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,' --blur-background-frame --glx-copy-from-front --glx-no-stencil --blur-background-exclude "focused" --use-ewmh-active-win &
