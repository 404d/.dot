#!/bin/sh
cd $HOME/.dot
git submodule init
git submodule update --recursive
cd $HOME
function confirm {
    echo "File or folder already exists: $HOME/$1"
    echo "Replace? (Y/n)"
    read CONFIRMATION
    if [ $CONFIRMATION == "Y" ]; then
        echo "Replacing $1";
        rm -rf $HOME/$1
        ln -s $HOME/.dot/$1
    fi
}
function lnk {
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

lnk .bash
lnk .bash_profile
lnk .gitconfig
lnk .irssi
lnk .hgrc
lnk .htoprc
lnk .tmux
lnk .tmux.conf
lnk .vim
lnk .vimrc
lnk .zsh
lnk .zshrc
