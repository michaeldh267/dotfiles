#!/bin/sh

if [ ! -e "$HOME/.vimrc" ]; then
	ln -sfv "$PWD/.vimrc" "$HOME/.vimrc";
fi

if [ ! -e "$HOME/.zshrc" ]; then
	ln -sfv "$PWD/.zshrc" "$HOME/.zshrc";
fi

#TODO /f link-if-not-exists
