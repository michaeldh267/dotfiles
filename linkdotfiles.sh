#!/bin/sh

#if ! [ -e "$HOME/.vimrc" ]; then
# Why test these? ln already tests if a file exists.
ln -sv "$PWD/.vimrc" "$HOME/.vimrc"
#fi

ln -sv "$PWD/.zshrc" "$HOME/.zshrc"


ln -sv "$PWD/.Xresources" "$HOME/.Xresources"

