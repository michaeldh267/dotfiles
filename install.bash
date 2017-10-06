#!/usr/bin/env bash
# sets up a new user

#set -e # exit if any command has non-zero return value
#set -u # exit if undefined reference found
#set -o pipefail # do not mask pipeline errors
#set -x # debug mode 
IFS=$'\n\t'

myk-install-home () {
cd $HOME/dotfiles
mkdir -pv ~/{.config,bin}
for package in *; do
	if [[ -d "$package" ]]; 
	then
		stow -R "$package"
	fi
done
source ~/.bashrc
xrdb ~/.Xresources
}
myk-install-home

install-vim() {
cd ~/dotfiles
mkdir -pv ~/.vim/{swp,backup,undo}
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle && \
	git clone https://github.com/sjl/badwolf
cd ~/.vim/bundle && \
	git clone https://github.com/vim-syntastic/syntastic
cd ~/.vim/bundle && \
	git clone git://github.com/tpope/vim-fireplace.git
cd ~/.vim/bundle && \
	git clone git://github.com/tpope/vim-classpath.git
cd ~/.vim/bundle && \
	git clone git://github.com/guns/vim-clojure-static.git
}
install-vim
