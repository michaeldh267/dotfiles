if [[ -f /etc/profile ]]; then
    . /etc/profile
fi

alias dl='cd ~/Downloads'
alias dt='cd ~/dotfiles'

export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"

export PYTHONSTARTUP=$HOME/.pythonrc

export GOPATH=$HOME/src

export PATH=/home/myk/bin:$PATH
export PATH=/home/myk/.local/bin:$PATH
export PATH=/home/myk/.luarocks/bin:$PATH
. /home/myk/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true


vim () {
    # My life for you, xfce4-terminal
    if [[ $TERM == "xterm" || $COLORTERM == "xfce4-terminal" ]]; then
	local TERM=xterm-256color 
    fi
    /usr/bin/vim "$*"
}

# Stuff out of Debian's .bashrc

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
