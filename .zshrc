export EDITOR=vim

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS

### Prompt
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

source $HOME/.zsh/eevee.zsh
source $HOME/.zsh/battery.zsh
source $HOME/.zsh/spectrum.zsh
source $HOME/.zsh/nowplaying/shell.zsh
source $HOME/.zsh/git-prompt/zshrc.sh
source $HOME/.zsh/virtualenv.zsh

source $HOME/.dot/.sh/minecraft.sh

source $HOME/.dot/.dot/updater.zsh

export GITWS="$HOME/Development/Git/Workspace"
export ZSH_THEME_GIT_PROMPT_NOCACHE="1"
alias tmux='tmux -2'

PROMPT='%{%(!.$fg_bold[red].$fg[178])%}%n@%m%{$reset_color%} %{$fg[202]%}${${PWD/#$GITWS/±}/#$HOME/~}%{$reset_color%}$(git_super_status) %(!.#.$) '

#PROMPT=''
#PROMPT='%{$bg[178]$fg[000]%} %m %{$fg[178]$bg[202]%}⮀%{$fg[000]%} ${${PWD/#$GITWS/±}/#$HOME/~} %{$reset_color$fg[202]%}⮀%{$reset_color%}$(git_super_status)'

if [ -e "/usr/games/bin" ]; then
    export PATH="/usr/games/bin/:$PATH"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Machine-specific extras

if [[ -r $HOME/.zlocal ]]; then
    source $HOME/.zlocal
fi
