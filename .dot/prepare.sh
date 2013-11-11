#!/bin/sh
cd $HOME/.dot
git submodule update --init --recursive
cd $HOME
confirm() {
    echo "File or folder already exists: $HOME/$1"
    echo "Replace? (Y/n)"
    read CONFIRMATION
    if [ $CONFIRMATION = "Y" ]; then
        echo "Replacing $1";
        rm -rf $HOME/$1
        ln -s $HOME/.dot/$1
    fi
}
lnk() {
    if [ -h $HOME/$1 ]; then
        echo "Skipping $1";
    elif [ -s $HOME/$1 ]; then
        confirm $1
    else
        if [ -d $HOME/$1 ]; then
            confirm $1
        else
            echo "Linked $1"
            ln -s $HOME/.dot/$1
        fi
    fi
}

lnkc() {
    if [ -h $2 ]; then
        echo "Skipping $2";
    elif [ -s $2 ]; then
        confirm $2
    else
        if [ -d $2 ]; then
            confirm $2
        else
            echo "Linked $2"
            ln -s $1 $2
        fi
    fi
}

lnk .bash
lnk .bash_profile
lnk .gitconfig
lnk .i3
lnk .irssi
lnk .hgrc
lnk .htoprc
lnk .tmux
lnk .tmux.conf
lnk .powerline
lnkc $HOME/.powerline $HOME/.config/powerline
lnk .vim
lnk .vimrc
lnk .zsh
lnk .zshrc
lnk .Xresources
