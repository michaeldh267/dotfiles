#!/bin/bash
# bashrc.local

# happy little functions
[ -f ~/.functions ] && source /home/myk/.functions

PATH_PUSH_ONCE "$HOME/bin"
PATH_PUSH_ONCE "$HOME/.local/bin"
PATH_PUSH_ONCE "$HOME/.luarocks/bin"
PATH_PUSH_ONCE "/usr/local/go/bin"
PATH_PUSH_ONCE "$HOME/kotlinc/bin"
PATH_PUSH_ONCE "$HOME/.yarn/bin"

export GOPATH=$HOME/go
#export LANG=en_US.UTF-8
#export LESS=MR
#export PAGER=most
export VISUAL=vim
export EDITOR="$VISUAL"

alias ls='ls --color=auto'

PS1="(\$?)[\@]{\w} \\u: "

# [ -f /usr/bin/fish ] && exec fish


export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper-3.sh

echo 'Figure out who you are and do it on purpose!'
