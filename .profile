command_exists() {
    command -v "$1" >/dev/null 2>&1
    return $?
}
host_is() {
    host=`hostname | sed 's/\..*$//' | tr A-Z a-z`
    we_want=`echo $1 | tr A-Z a-z`
    return `[ "x$host" = "x$we_want" ]`
}
init_compositor() {
    if command_exists compton; then
        if [ "$COMPOSITOR_BLURBACKGROUND" = '1' ]; then
            compositor_options_blur="--blur-background --blur-kern 5,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, --blur-background-frame --blur-background-exclude focused"
        fi
        if [ "$COMPOSITOR_FADE" = '1' ]; then
            compositor_options_fade='-f'
        fi
        if [ "$COMPOSITOR_SHADOW" = '1' ]; then
            ## --shadow | -c
            # Enabled client-side shadows on windows. Note desktop windows (windows with _NET_WM_WINDOW_TYPE_DESKTOP) never get shadow.

            ## --no-dnd-shadow | -G
            # Don’t draw shadows on drag-and-drop windows.

            ## --no-dock-shadow | -C
            # Avoid drawing shadows on dock/panel windows.

            ## --shadow-ignore-shaped
            #  Do not paint shadows on shaped windows. Note shaped windows here means windows setting its shape through X Shape extension. Those using ARGB background is beyond our control.

            # Sett opp shadow-exclude mot blant annet Slingshot og notifyosd
            compositor_options_shadow="--shadow --no-dnd-shadow --no-dock-shadow --shadow-ignore-shaped"
        fi
        if [ "$COMPOSITOR_OPACITY" = '1' ]; then
            ## --inactive-opacity=OPACITY | -i
            # Opacity of inactive windows. (0.1 - 1.0, disabled by default)

            # --opacity-rule rules are defined in .compton.conf
            compositor_options_opacity="--inactive-opacity=0.8"
        fi
        if [ "$COMPOSITOR_GLX" = '1' ]; then
            ## --backend BACKEND
            # Specify the backend to use: xrender or glx.

            ## --glx-no-stencil
            # Avoid using stencil buffer, useful if you don’t have a stencil buffer. Might cause incorrect opacity when rendering transparent content (but never practically happened) and may not work with --blur-background.

            ## --glx-copy-from-front
            # Copy unmodified regions from front buffer instead of redrawing them all.
            compositor_options_glx='--backend glx --glx-no-stencil ' # --glx-copy-from-front'
        fi
        # -b -- Daemonize
        export CMD_COMPOSITOR="compton --config ~/.compton.conf -b --mark-wmwin-focused --mark-ovredir-focused --use-ewmh-active-win $compositor_options_opacity $compositor_options_blur $compositor_options_fade $compositor_options_shadow $compositor_options_glx $compositor_options_extra"
        ( (eval $CMD_COMPOSITOR) &) || true
        export COMPOSITOR=compton
    fi
    return 0
}

export COMPOSITOR_SHADOW='1'
export COMPOSITOR_FADE='0'
export COMPOSITOR_OPACITY='1'
export COMPOSITOR_GLX='1'
if host_is "Yukiho"; then
    #.dot/bin/screen-manage dual-hybel gamecorner

    # Compositor config
    export COMPOSITOR_BLURBACKGROUND='1'
    init_compositor
    COMPOSITOR_STARTED='1'

    if command_exists conky; then
        for file in .conky/yukiho/*; do
            (conky -c $file &) || true
        done
    fi
    # Worked fine without until recently
    compositor_options_extra='--vsync opengl-mswc'
fi
if host_is "Katsumi"; then
    if command_exists conky; then
        for file in .conky/katsumi/*; do
            (conky -c $file &) || true
        done
    fi
    compositor_options_extra='--vsync opengl-mswc'
fi
if host_is "Maou"; then
    COMPOSITOR_SHADOW='0'
    COMPOSITOR_FADE='0'
    COMPOSITOR_GLX='0'
    # Get rid of that stupid context menu button
    xmodmap -e "keycode 135 = Super_R NoSymbol Super_R"
fi

if [ -z $COMPOSITOR_STARTED ]; then
    init_compositor
fi

if command_exists ssh-agent; then
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval `ssh-agent`
        trap "kill $SSH_AGENT_PID" 0
    fi
fi

if command_exists urxvtd; then
    (urxvtd -q -f -o &) || true
    export TERMINAL=urxvtc
fi

if command_exists skippy-xd; then
    (skippy-xd --start-daemon --config $HOME/.dot/skippy-xd &) || true
fi

if command_exists mpd; then
    (mpd &) || true
    if command_exists mpdscribble; then
        (mpdscribble &) || true
    fi
fi

if command_exists redshift; then
    (redshift -t 6500K:3700K &) || true
fi

setxkbmap -option 'ctrl:nocaps' || true

if command_exists dropbox; then
    #(dropbox start &) || true
fi

if command_exists pulseaudio; then
    (pulseaudio -D &) || true
fi

if command_exists xscreensaver; then
    (xscreensaver &) || true
fi

if command_exists xautolock; then
    (xautolock -locker 'zsh ~/.i3/bin/i3-locker.zsh' -time 5 -corners --00 -cornersize 5 -cornerdelay 2 -cornerredelay 10 -detectsleep &) || true
fi


if command_exists zsh; then
    ($HOME/.dot/config-compile $HOME/.dot/.i3/configs $HOME/.dot/.i3/config) || true
fi
