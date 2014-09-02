source $HOME/.i3/bin/config.zsh

if [[ "$1" == "-p" ]]; then
    P=" -p"
fi
if [[ "$2" == "-u" ]]; then
    U="u"
fi
if [[ "$2" == "-s" ]]; then
    U="s"
fi
if [[ $U == 's' ]]; then
    escrotum -s -e "beep -l 10 && ablaze -s$P \$f && beep -f 400 -l 100 -n -f 500 -l 100 && mv \$f $SCREENSHOT_DIR"
else
    scrot -b$U -e "beep -l 10 && ablaze -s$P \$f && beep -f 400 -l 100 -n -f 500 -l 100 && mv \$f $SCREENSHOT_DIR" -q 100
fi
