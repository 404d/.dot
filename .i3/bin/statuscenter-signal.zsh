source $HOME/.i3/bin/config.zsh

cd $STATUSCENTER_DIR
source bin/activate
python contrib/nowplaying/signal.py $@
