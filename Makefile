all: vim dotfiles

dotdir=~/dotfiles

vim: vimrc
	ln -svf $(dotdir)/vimrc ~/.vimrc
dotfiles: bash_aliases
	echo "bash_aliases"
