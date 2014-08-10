echo $(($(cat /sys/class/leds/smc::kbd_backlight/brightness)+51)) > /sys/class/leds/smc::kbd_backlight/brightness
