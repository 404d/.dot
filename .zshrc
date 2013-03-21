export EDITOR=vim

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS

source $HOME/.zsh/eevee.zsh
source $HOME/.zsh/battery.zsh
source $HOME/.zsh/spectrum.zsh
source $HOME/.zsh/nowplaying/shell.zsh
source $HOME/.zsh/git-prompt/zshrc.sh
source $HOME/.zsh/virtualenv.zsh

source $HOME/.dot/.sh/minecraft.sh

source $HOME/.dot/.dot/updater.zsh

export ZSH_THEME_GIT_PROMPT_NOCACHE="1"
alias tmux='tmux -2'
alias yoink='git pull'
alias pusj='git push'       

PROMPT='%{%(!.$fg_bold[red].$fg[178])%}%n@%m%{$reset_color%} %{$fg[202]%}${${PWD/#$GITWS/±}/#$HOME/~}%{$reset_color%}$(git_super_status) %(!.#.$) '
### Machine-specific extras

if [[ -r $HOME/.zlocal ]]; then
    source $HOME/.zlocal
fi
