##
#   Copyright (c) 2013, Alex Munroe
#   https://raw.github.com/eevee/rc/de88fa270512b70e90680b5f05fb97ca2b30e02b/.tmux.conf
#   
#   The year specified above is the year this file was added to this repository.
##

# Switch me back to ^A, thanks
set-option -g prefix C-a
unbind-key C-b
bind-key a send-prefix

# I miss ^A^A and ^ASpace
bind-key C-a last-window
bind-key Space next-window
bind-key C-Space previous-window

# Options
set-option -sg escape-time 50  # this makes vim fucking awful to use
set-option -g base-index 1
set-option -g default-terminal screen-256color
set-option -g lock-command vlock
set-window-option -g xterm-keys on  # to make ctrl-arrow, etc. work

set-option -g set-titles on
set-option -g set-titles-string '[#S:#I #H] #W'  # use screen title

# COLORS.
# For reference, the xterm color cube points are: 00, 5F, 87, AF, D7, FF
# Status bar has a dim gray background
set-option -g status-bg colour234
set-option -g status-fg colour0
# Left shows the session name, in blue
set-option -g status-left-bg default
set-option -g status-left-fg colour74
# Right is some CPU stats, so terminal green
set-option -g status-right-bg default
set-option -g status-right-fg colour71
# Windows are medium gray; current window is white
set-window-option -g window-status-fg colour244
set-window-option -g window-status-current-fg '#ffffff'
set-window-option -g window-status-current-bg '#000000'
# Beeped windows get a blinding orange background
set-window-option -g window-status-bell-fg '#000000'
set-window-option -g window-status-bell-bg '#d78700'
set-window-option -g window-status-bell-attr none
# Trim window titles to a reasonable length
set-window-option -g window-status-format '#[fg=yellow]#F#I#[default] #32W '
set-window-option -g window-status-current-format '#[fg=yellow] #I#[default] #32W '