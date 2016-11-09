source $HOME/.i3/bin/config.zsh

if [[ "$1" == "1" ]]; then
    touch $GROUNDBREAKER_DIR/run.lock && \
    rm $GROUNDBREAKER_DIR/bg $GROUNDBREAKER_DIR/stitch.png && \
    cp $GROUNDBREAKER_DIR/black.png $GROUNDBREAKER_DIR/bg && \
    cp $GROUNDBREAKER_DIR/black.png $GROUNDBREAKER_DIR/stitch.png && \
    feh --bg-scale $GROUNDBREAKER_DIR/bg
    pkill -9 mplayer
    pkill -9 gifview
elif [[ "$1" == "0" ]]; then
    rm $GROUNDBREAKER_DIR/run.lock
fi
