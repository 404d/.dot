#!/bin/zsh
function .dot() {
    if [[ -n $1 ]]; then
        if [[ $1 == "update" ]]; then
            dotdot-update
        else
            dotdot-usage
        fi
    else
        dotdot-usage
    fi
}
function dotdot-usage() {
echo "    .dot manager
    ……………………………………………………………………………
    update     updates and reloads your dotfiles
    ……………………………………………………………………………
      .dot © Simen Lybekk 2013"
}

function dotdot-update() {
    origDir=`pwd`
    cd $HOME/.dot
    echo "$fg_bold[blue]± FETCHING ±$reset_color"
    git fetch
    git lg -p HEAD..origin/master | less
    tmp=
    vared -p "Do you want to update? (yes to continue) " tmp
    if [[ $tmp == "yes" ]]; then
        git merge origin/master
        cd $HOME
        zsh $HOME/.dot/.dot/prepare.sh
        source $HOME/.zshrc
    fi
    cd $origDir
    origDir=""
}
