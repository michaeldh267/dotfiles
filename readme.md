# Here are my dotfiles.
It's a work in progress. The Goal is to have some setup script that installs my
files in a fresh Debian (or derivative) environment, but I'm a ways from that.

## Requirements for my setup scripts
1. Debian, but Ubuntu might work
2. git
3. GNU stow
4. sudo
5. bash

### Individual scripts
    myk-stow
Symlinks my config files under ~/dotfiles to where they need to be.


    myk-sync2
Installs extra debian packages.

    myk-install-vim
Installs my favorite vim packages {syntastic, badwolf, vim-fugitive} 
