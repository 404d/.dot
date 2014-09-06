#!/bin/cat
# vim:syntax=i3
bindcode $mod+Shift+61 exec zsh $basedir/bin/i3-safebg.zsh 1 # Clear and stop
bindcode $mod+Shift+60 exec zsh $basedir/bin/i3-safebg.zsh 0 # Remove lock (restart)
