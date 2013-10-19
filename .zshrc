export EDITOR=vim

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS

for sourcefile ($HOME/.zsh/pre/*.zsh) {
    source $sourcefile
}
for sourcefile ($HOME/.zsh/*.zsh) {
    source $sourcefile
}

source $HOME/.dot/.sh/minecraft.sh

source $HOME/.dot/.dot/updater.zsh

export ZSH_THEME_GIT_PROMPT_NOCACHE="1"
alias tmux='tmux -2'
alias yoink='git pull'
alias pusj='git push'

P_USER="%n"
if [[ -n "$SSH_CONNECTION" ]]; then
    P_HOST="%m"
fi
P_COMP="%{$fg[000]$bg[007]%} $P_USER"'$([ -n "$P_USER" ] && [ -n "$P_HOST" ] && echo "  ")'"$P_HOST "

if [[ -z "$VIRTUAL_ENV" ]]; then
    VIRTUAL_ENV=" "
fi
PROMPT="$P_COMP"'$([ -n "$P_COMP" ] && echo "%{$reset_color$fg[007]%} %{$reset_color$fg[000]$bg[031]%}%{$fg[117]%}") $([ -n "$VIRTUAL_ENV" ] && [ -z "e" ] && [ "$VIRTUAL_ENV" != " " ] && [ `pwd` != $VIRTUAL_ENV ]&& echo "⑇ "$(basename "$VIRTUAL_ENV")"  ")${${${PWD/#$VIRTUAL_ENV/⑇ $(basename "$VIRTUAL_ENV")}/#$GITWS/±}/#$HOME/~}$(git_super_status) %{$reset_color$fg[031]%}%{$reset_color%} '

for sourcefile ($HOME/.zsh/post/*.zsh) {
    source $sourcefile
}

### Machine-specific extras
VIRTUAL_ENV_DISABLE_PROMPT=true

if [[ -r $HOME/.zlocal ]]; then
    source $HOME/.zlocal
fi
