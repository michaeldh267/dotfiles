export TERM=gnome-256color
bindkey -e
autoload -Uz promptinit
promptinit
prompt off
zmodload -i zsh/complist
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit
#eval "$(stack --bash-completion-script stack)" # stack req
setopt append_history \
	inc_append_history \
	share_history \
	extended_history \
	hist_ignore_space \
	hist_ignore_all_dups \
	hist_find_no_dups \
	hist_save_no_dups \
	autocd \
	no_beep \
	bg_nice \
	always_last_prompt \
	auto_menu \
	auto_list \
	complete_in_word \
	always_to_end \
	list_ambiguous \
	glob_complete \
	rec_exact
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
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on 
zstyle ':completion:*' rehash true
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # +case insens
REPORTTIME=5
#alias isapt='sudo apt install'
#alias usapt='sudo apt update && sudo apt upgrade'
alias l='pwd && ls --color=auto'
alias ls='ls --color=auto -X'
alias la='ls --color=auto -Xa'
alias st='stterm -f "Liberation Mono:size=15"'
alias j='jobs'
alias m='mocp'
alias v='vim'
#alias vzshrc='vim $HOME/.zshrc'
#alias rm='rm -i'
alias dateh="date +'%A %B %d %l:%M:%S %p %Z %z'"
# Who loves the path?
typeset -U PATH
#export PATH=$HOME/bin:$PATH
#export PATH=$HOME/algs4/bin:$PATH
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/work
export PATH=$PATH:$GOPATH/bin # convenience
#export PATH=$PATH:/opt/rakudo-star-2016.07/bin
#export PATH=$PATH:/opt/rakudo-star-2016.07/share/perl6/site/bin
