#!/usr/bin/env bash
# install my vim things

#set -e # exit if any command has non-zero return value
#set -u # exit if undefined reference found
#set -o pipefail # do not mask pipeline errors
#set -x # debug mode 
#IFS=$'\n\t'
install-vim() {
	( # subshell
	cd ~/dotfiles
	xstow vim
	mkdir -pv ~/.vim/{swp,backup}
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
		curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	cd ~/.vim/bundle && \
		git clone https://github.com/sjl/badwolf
	cd ~/.vim/bundle && \
		git clone https://github.com/vim-syntastic/syntastic
	)
}
install-vim
