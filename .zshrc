export TERM=xterm-256color
bindkey -e
#zstyle :compinstall filename '/home/myk/.zshrc'
autoload -Uz promptinit
promptinit
prompt off
zmodload -i zsh/complist
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)" # stack req
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
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select=2 # use menu if more than 2 ambiguous result
zstyle ':completion:*' use-cache on 
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # +case insens
REPORTTIME=5
alias isapt='sudo apt install'
alias usapt='sudo apt update && sudo apt upgrade'
alias l='pwd && ls --color=auto'
alias ls='ls --color=auto -X'
alias la='ls --color=auto -Xa'
alias j='jobs'
alias m='mocp'
alias v='vim'
alias vzshrc='vim $HOME/.zshrc'
#alias AppendTo='>>' Of course this didn't work right...
#alias rm='rm -i'
alias dateh="date +'%A %B %d %l:%M:%S %p %Z %z'"
# Who loves the path?
typeset -U PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/algs4/bin:$PATH
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/work
export PATH=$PATH:$GOPATH/bin # convenience
export PATH=$PATH:/opt/rakudo-star-2016.07/bin
export PATH=$PATH:/opt/rakudo-star-2016.07/share/perl6/site/bin
