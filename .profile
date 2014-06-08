command_exists() {
    return command -v "$1" >/dev/null 2>&1
}

if [ `hostname` = "Yukiho" ]; then
    xrandr --output DVI-D-0 --gamma 1.5:1.5:1.5 --right-of VGA-0 --primary
    xrandr --output HDMI-0 --right-of DVI-D-0
    xrandr --output DVI-D-0 --primary
    xinput set-button-map 8 1 2 3 4 5 6 7 2 9 10 11 12 13

    for file in .conky/yukiho/*; do
        conky -c $file &
    done
fi

if command_exists urxvtd; then
    urxvtd -q -f -o &
    export TERMINAL=urxvtc
fi

if command_exists mpd; then
    mpd &
    if command_exists mpdscribble; then
        mpdscribble &
    fi
fi

setxkbmap -option 'ctrl:swapcaps'

if command_exists ssh-agent; then
    SSHAGENT="$(which ssh-agent)"
    SSHAGENTARGS="-s"
    if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
        eval `$SSHAGENT $SSHAGENTARGS`
        trap "kill $SSH_AGENT_PID" 0
    fi
fi
