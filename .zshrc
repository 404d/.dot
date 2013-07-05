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
DIR='%{$bg[236]%} %{$fg[243]%}${${PWD/#$GITWS/±}/#$HOME/~} %{$reset_color$fg[236]%}'

P_USER="%n"
if [[ -n "$SSH_CONNECTION" ]]; then
    P_HOST="%m"
fi
P_COMP=" $P_USER"'$([ -n "$P_USER" ] && [ -n "$P_HOST" ] && echo "  ")'"$P_HOST "

if [[ -z "$VIRTUAL_ENV" ]]; then
    VIRTUAL_ENV=" "
fi
PROMPT="$P_COMP"'$([ -n "$P_COMP" ] && echo "") $([ -n "$VIRTUAL_ENV" ] && [ "$VIRTUAL_ENV" != " " ] && [ `pwd` != $VIRTUAL_ENV ]&& echo "⑇ "$(basename "$VIRTUAL_ENV")"  ")${${${PWD/#$VIRTUAL_ENV/⑇ $(basename "$VIRTUAL_ENV")}/#$GITWS/±}/#$HOME/~}$(git_super_status)  '
PS1=$PROMPT
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
### Machine-specific extras

VIRTUAL_ENV_DISABLE_PROMPT=true

if [[ -r $HOME/.zlocal ]]; then
    source $HOME/.zlocal
fi
