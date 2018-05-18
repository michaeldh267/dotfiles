#!/bin/bash
# bashrc.local
# END DEFAULT CONFIGURATION
shopt -s cdspell checkhash checkjobs dirspell no_empty_cmd_completion
# happy little functions
[ -f ~/.functions ] && source /home/myk/.functions

PATH_PUSH_ONCE "$HOME/bin"
PATH_PUSH_ONCE "$HOME/.local/bin"
PATH_PUSH_ONCE "$HOME/.luarocks/bin"

export GOPATH=$HOME/go
export LANG=en_US.UTF-8
#export LESS=MR
#export PAGER=most
export VISUAL=emacs
export EDITOR="$VISUAL"

alias dt='cd ~/dotfiles && ls'
alias dl='cd ~/Downloads && ls'
alias doc='cd ~/Documents && ls'
