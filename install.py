#!/usr/bin/env python3
# A gross python script that installs my dotfiles and pulls from github

import subprocess
import os

def git_sync(x):
    '''Clone a git repo or pull'''
    try:
        subprocess.check_call(["git", "clone", x])
    except subprocess.CalledProcessError as e:
        print(e, e.returncode)
        os.chdir(x.split('/')[-1:][0])
        subprocess.check_call(["git", "pull"])
        os.chdir(os.path.expandvars(".."))

repos = [
        "https://github.com/vim-syntastic/syntastic",
        "https://github.com/tpope/vim-fugitive",
        "https://github.com/tpope/vim-sleuth",
        "https://github.com/sjl/badwolf",
        "https://github.com/jceb/vim-orgmode",
        "https://github.com/tpope/vim-speeddating",
        #"https://github.com/scrooloose/nerdtree",
        #"https://github.com/kien/ctrlp.vim",
        #"https://github.com/kien/rainbow_parentheses.vim",
        "https://github.com/fatih/vim-go",
        ]

HOME=os.path.expandvars("$HOME")

def install_pathogen():
    '''Setup pathogen'''
    os.chdir(os.path.join(HOME, ".vim"))
    git_sync("https://github.com/tpope/vim-pathogen")
    src=os.path.join(HOME, ".vim", "vim-pathogen", "autoload", "pathogen.vim")
    dst=os.path.join(HOME, ".vim", "autoload", "pathogen.vim")
    try:
        os.symlink(src, dst)
    except OSError as e:
        print(e)
        # TODO atomic replace (create tmp file, rename)?


def install_vim_plugins():
    '''Sync all the repos from git'''
    os.chdir(os.path.join(HOME, ".vim", "bundle"))
    for x in repos:
        git_sync(x)


def make_dirs():
    '''Directories grow on trees!'''

    directories = [
        "$HOME/.vim/autoload",
        "$HOME/.vim/bundle",
        "$HOME/.vim",
        "$HOME/.emacs.d/",
        "$HOME/.config/fontconfig",
        "$HOME/.netbeans/8.1/etc",
        "$HOME/bin"
        ]

    for d in directories:
        try:
            os.mkdir(os.path.expandvars(d))
        except OSError as e:
            print(e,d)



DOTDIR = os.path.join(HOME, "dotfiles")

def symlink_dotfiles():
    '''Symlinkin'''
    links = [
        ("vimrc", ".vimrc"),
        ("bashrc", ".bashrc.local"),
        ("functions", ".functions"),
        ("Xresources", ".Xresources"),
        ("fonts.conf", ".config/fontconfig/fonts.conf"),
        ("inputrc", ".inputrc"),
        ("pythonrc", ".pythonrc"),
        ("emacs", ".emacs"),
        ("netbeans.conf", ".netbeans/8.1/etc/netbeans.conf"),
        ]

    for x in links:
        src=os.path.join(DOTDIR,x[0])
        dst=os.path.join(HOME,x[1])
        try:
            os.symlink(src, dst)
        except OSError as e:
            print(e,x)

if __name__ == '__main__':
    make_dirs()
    install_pathogen()
    install_vim_plugins()
    symlink_dotfiles()
