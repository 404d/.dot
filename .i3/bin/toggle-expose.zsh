#!/usr/bin/zsh
pgrep skippy-xd
if [[ "$?" == "0" ]]; then
    pkill skippy-xd
else
    skippy-xd
fi
