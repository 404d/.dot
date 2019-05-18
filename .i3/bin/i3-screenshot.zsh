source $HOME/.i3/bin/config.zsh
# fuck deg i3
#t="-desktop"
t=""
d="5"
if [[ "$1" == "-p" ]]; then
    P=" -p"
    d=""
fi
if [[ "$2" == "-u" ]]; then
    U="u"
    t=""
    d=""
fi
if [[ "$2" == "-s" ]]; then
    U="s"
    t=""
    d=""
fi
if [[ $U == 's' ]]; then
    escrotum -s -e "beep -l 10 && ablaze -s$P \$f && beep -f 400 -l 100 -n -f 500 -l 100 && ((feh --title i3-screenshot \$f &) ) && mv \$f $SCREENSHOT_DIR"
else
    scrot -b$U -e "beep -l 10 && ablaze -s$P \$f && beep -f 400 -l 100 -n -f 500 -l 100 && ((feh --title i3-screenshot$t \$f &) && sleep 1$d && pkill feh) && mv \$f $SCREENSHOT_DIR" -q 100
fi
