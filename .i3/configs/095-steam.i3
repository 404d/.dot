#!/bin/cat
# Make chats float
for_window [title=".*Chat$" class="Steam"] floating enable
for_window [title=".*Chat$" class="Steam"] border none
# No
for_window [title=".+News" class="Steam"] kill
