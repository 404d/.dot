.dot
====

All my different settings, scripts and such.

## Quick and dirty setup

Note that this will also install my .git_profile as the script is made for me to set it up on my computers.
Rather than using this script, you should copy the parts that you need/are going to use.

**NOTE** There's a bug when running `prepare.sh` with `sh` on some systems. Please use either `bash` or `zsh`
instead!

    cd ~
    git clone https://github.com/404d/.dot.git
    bash .dot/.dot/prepare.sh
