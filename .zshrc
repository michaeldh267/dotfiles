export TERM=xterm-256color
bindkey -e
#zstyle :compinstall filename '/home/myk/.zshrc'
autoload -Uz promptinit
promptinit
prompt off
zmodload -i zsh/complist
autoload -U compinit && compinit
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
alias l='ls --color=auto'
alias ls='ls --color=auto -X'
alias la='ls --color=auto -Xa'
alias j='jobs'
alias m='mocp'
alias v='vim'

# Who loves the path?
export PATH=~/bin:$PATH
