#!/bin/sh
cd $HOME/.dot
git submodule update --init --recursive
cd $HOME
confirm() {
    echo "File or folder already exists: $1"
    echo "Replace? (y/N)"
    read CONFIRMATION
    [ "$CONFIRMATION" = "Y" ] || [ "$CONFIRMATION" = "y" ]
}
lnk() {
    if [ -h "$HOME/$1" ]; then
        echo "Skipping $1";
        return
    elif ([ -s "$HOME/$1" ] || [ -d "$HOME/$1" ]); then
        confirm $HOME/$1 || return
        rm -rf $HOME/$1
    fi
    echo "Linking $1"
    ln -s "$HOME/.dot/$1"
}

lnkc() {
    if [ -h "$2" ]; then
        echo "Skipping $2";
        return
    elif ([ -s "$2" ] || [ -d "$2" ]); then
        confirm "$2" || return
        rm -rf $2
    fi
    echo "Linking $2"
    mkdir -p "$(dirname $2)"
    ln -s "$1" "$2"
}

lnk .bash
lnk .bash_profile
lnk .conky
lnk .compton.conf
lnk .gitconfig
lnk .gtkrc-2.0
lnk .i3
lnk .irssi
lnk .hgrc
lnk .htoprc
lnk .tmux
lnk .tmux.conf
lnk .powerline
lnkc $HOME/.powerline $HOME/.config/powerline
lnkc $HOME/.dot/systemd-user $HOME/.config/systemd/user
lnk .ncmpcpp
lnk .vim
lnk .vimrc
lnk .zsh
lnk .zshrc
lnk .Xresources
lnk .xscreensaver
