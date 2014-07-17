command_exists() {
    command -v "$1" >/dev/null 2>&1
    return $?
}

if [ `hostname` = "Yukiho" ]; then
    xrandr --output DVI-D-0 --gamma 1.5:1.5:1.5 --right-of VGA-0 --primary || true
    xrandr --output HDMI-0 --right-of DVI-D-0 || true
    xrandr --output DVI-D-0 --primary || true
    xinput set-button-map 8 1 2 3 4 5 6 7 2 9 10 11 12 13 || true

    # Compositor config
    export COMPOSITOR_BLURBACKGROUND='1'

    if command_exists conky; then
        for file in .conky/yukiho/*; do
            (conky -c $file &) || true
        done
    fi
fi
if [ `hostname` = "Katsumi" ]; then
    if command_exists conky; then
        for file in .conky/katsumi/*; do
            (conky -c $file &) || true
        done
    fi
fi

if command_exists urxvtd; then
    (urxvtd -q -f -o &) || true
    export TERMINAL=urxvtc
fi

if command_exists mpd; then
    (mpd &) || true
    if command_exists mpdscribble; then
        (mpdscribble &) || true
    fi
fi

setxkbmap -option 'ctrl:swapcaps' || true

if command_exists dropbox; then
    (dropbox start &) || true
fi

if command_exists pulseaudio; then
    (pulseaudio -D &) || true
fi

if command_exists xscreensaver; then
    (xscreensaver &) || true
fi

if command_exists xautolock; then
    (xautolock -locker 'zsh $basedir/bin/i3-locker.zsh' -time 10 -corners 0-00 &) || true
fi

if command_exists compton; then
    if [ "$COMPOSITOR_BLURBACKGROUND" = '1' ]; then
        compositor_options_blur='--blur-background --blur-kern "5,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1," --blur-background-frame --blur-background-exclude "focused"'
    fi
    (compton -cCzfbi 0.8 --mark-wmwin-focused --mark-ovredir-focused --vsync opengl --glx-copy-from-front --glx-no-stencil --use-ewmh-active-win $compositor_options_blur &) || true
    export CMD_COMPOSITOR="compton -cCzfbi 0.8 --mark-wmwin-focused --mark-ovredir-focused --vsync opengl --glx-copy-from-front --glx-no-stencil --use-ewmh-active-win $compositor_options_blur &"
    export COMPOSITOR=compton
    if command_exists compton-trans; then
        ((sleep 60 && compton-trans --name "i3bar for output LVDS1" 78) &) || true
    fi
fi

if command_exists zsh; then
    ($HOME/.dot/config-compile $HOME/.dot/.i3/configs $HOME/.dot/.i3/config) || true
fi

if command_exists ssh-agent; then
    SSHAGENT="$(which ssh-agent)"
    SSHAGENTARGS="-s"
    if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
        eval `$SSHAGENT $SSHAGENTARGS`
        trap "kill $SSH_AGENT_PID" 0
    fi
fi
