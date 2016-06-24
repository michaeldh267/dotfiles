export TERM=xterm-256color
bindkey -e
autoload -Uz promptinit
promptinit
prompt off
zmodload -i zsh/complist
autoload -U compinit && compinit
setopt inc_append_history # save history line by line
setopt share_history # restore history line by line
setopt extended_history # timestamps saved to history file
setopt hist_ignore_space # ignore history entry if starts with space ch
setopt hist_ignore_all_dups # remove earlier duplicate lines
setopt hist_find_no_dups # history search finds only once
setopt hist_save_no_dups # remove duplicates when saving
setopt autocd # directory as command does cd
setopt no_beep # no beeping beeping
# setopt glob_complete
# setopt rec_exact
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select=2 # use menu if more than 2 ambiguous result
zstyle ':completion:*' use-cache on 
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # +case insens
REPORTTIME=5
alias l='ls --color=auto'
alias ls='ls --color=auto -X'
alias la='ls --color=auto -Xa'
alias j='jobs'
alias m='mocp'
alias v='vim'

# Who loves the path?
export PATH=~/bin:$PATH
