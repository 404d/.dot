#!/bin/zsh

# checks for and activates virtualenv
function venv {
    if [ -n "${${VIRTUAL_ENV}// /}" ]; then
        return
    fi
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

function deactivate {
    echo "Not in a virtual environment."
    return 1
}

function denv {
    deactivate
    r=$?

    function deactivate {
        echo "Not in a virtual environment."
        return 1
    }
    return $r
}

function renv {
    if [ -n "${${VIRTUAL_ENV}// /}" ]; then
        denv
    fi
    venv
}

# check for virtualenv at launch
venv
