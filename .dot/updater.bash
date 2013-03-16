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
    upgrade     updates and reloads your dotfiles
    ……………………………………………………………………………
      .dot © Simen Lybekk 2013"
}

function dotdot-update() {
    origDir=`pwd`
    cd $HOME/.dot
    echo "± FETCHING ±"
    git fetch
    echo "± LOG - HEAD ±"
    git lg HEAD..origin/master
    echo "± LOG END - HEAD ±"
    tmp=
    echo -n "Do you want to update? (yes to continue) "
    read tmp
    if [[ $tmp == "yes" ]]; then
        git merge origin/master
        cd $HOME
        sh $HOME/.dot/.dot/prepare.sh
        source $HOME/.bash_profile
    fi
    cd $origDir
    origDir=""
}
