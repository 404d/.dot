#!/bin/sh

MPD_MUSIC_PATH="/home/sl/.mpd/music"
TMP_COVER_PATH="/tmp/mpd-track-cover"

exiftool -b -CoverArt "$MPD_MUSIC_PATH/$(mpc --format "%file%" current)" > "$TMP_COVER_PATH"
