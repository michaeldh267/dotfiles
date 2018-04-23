#!/bin/bash


mkdir -p "$HOME/.fluxbox/styles"

(
dotdir="$HOME/dotfiles"
ln -sf "$dotdir/fluxbox/init" "$HOME/.fluxbox/init"
ln -sf "$dotdir/fluxbox/keys" "$HOME/.fluxbox/keys"
ln -sf "$dotdir/fluxbox/menu" "$HOME/.fluxbox/menu"
python "$dotdir/fluxbox/themer"
)
