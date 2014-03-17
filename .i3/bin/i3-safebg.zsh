source $HOME/.i3/bin/config.zsh

if [[ "$1" == "1" ]]; then
    touch $GROUNDBREAKER_DIR/run.lock && \
    rm $GROUNDBREAKER_DIR/bg $GROUNDBREAKER_DIR/lock.png && \
    cp $GROUNDBREAKER_DIR/black.png $GROUNDBREAKER_DIR/bg && \
    cp $GROUNDBREAKER_DIR/black.png $GROUNDBREAKER_DIR/lock.png && \
    feh --bg-scale $GROUNDBREAKER_DIR/bg
elif [[ "$1" == "0" ]]; then
    rm $GROUNDBREAKER_DIR/run.lock
fi
