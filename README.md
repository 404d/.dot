.dot
====

All my different settings, scripts and such.

## Quick and dirty setup

Note that this will also install my .git_profile as the script is made for me to set it up on my computers.
Rather than using this script, you should copy the parts that you need/are going to use.

`prepare.sh` should (at the moment) support `dash`, `bash` and `zsh`.

    cd ~
    git clone https://github.com/404d/.dot.git
    bash .dot/.dot/prepare.sh

## Tweaking
### MacBook Pro Trackpad
<http://www.chris-reilly.org/blog/technotes/macbook-trackpad-in-ubuntu/>

### YCM complaining about C++ STL not working
Example being it doesn't recognize the string class.

Solution: <http://stackoverflow.com/questions/33793281/unistd-h-file-not-found-clang-and-os-x#comment56411171_33793281>

### Python under OS X
Lemme make this brief: **DO NOT INSTALL HOMEBREW PYTHON**

Download an official release from the Python homepage and install it, then use easy_install to get
pip onto your system.

### Vim lagging severly
Is `vim-fugutive` installed? Remove it, you ain't using it anyways.

<http://wilt.isaac.su/articles/vim-lagging-and-causing-network-io-when-moving-within-a-file>
