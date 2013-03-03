#!/bin/zsh

# checks for and activates virtualenv
function venv {
    if [ -e "bin/activate" ]; then
        source bin/activate
    elif [ -e "venv/bin/activate" ]; then
        source venv/bin/activate
    fi
}

# hook to automatically activate virtualenv if present
function chpwd {
    venv
}

# check for virtualenv at launch
venv
