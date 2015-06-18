#!/usr/bin/zsh
DEVICE="$1"
MAX="$(cat $DEVICE/max_brightness)"
CURRENT="$(cat $DEVICE/brightness)"

STEPS=20
PER_STEP="$(($MAX / $STEPS))"

if [[ "$2" == "+" ]]; then
    NEW="$(($CURRENT + $PER_STEP))"
fi
if [[ "$2" == "-" ]]; then
    NEW="$(($CURRENT - $PER_STEP))"
fi

if [[ $NEW -gt $MAX ]]; then
    NEW=$MAX
fi
if [[ $NEW -lt 0 ]]; then
    NEW=0
fi

echo $NEW > $DEVICE/brightness
