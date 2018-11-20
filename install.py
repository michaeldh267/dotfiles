#!/usr/bin/env python3
# A gross python script that installs my dotfiles and pulls from github

import subprocess
import os

HOME = os.path.expandvars("$HOME")
DOTDIR = os.path.join(HOME, "dotfiles")
VIMHOME = os.path.join(HOME, ".vim")
BUNDLEDIR = os.path.join(VIMHOME, "bundle")

DIRS = [
        [VIMHOME,"autoload"],
        [BUNDLEDIR],
        [VIMHOME],
        [HOME,".emacs.d"],
        [HOME,".config","fontconfig"],
        [HOME,".netbeans","8.1","etc"],
        [HOME, "bin"]
        ]

LINK_MAP = [
        ([DOTDIR, "vimrc"], [HOME, ".vimrc"]),
        ([DOTDIR, "bashrc"], [HOME, ".bashrc.local"]),
        ([DOTDIR, "functions"], [HOME, ".functions"]),
        ([DOTDIR, "Xresources"], [HOME, ".Xresources"]),
        ([DOTDIR, "fonts.conf"], [HOME, ".config","fontconfig","fonts.conf"]),
        ([DOTDIR, "inputrc"], [HOME, ".inputrc"]),
        ([DOTDIR, "pythonrc"], [HOME, ".pythonrc"]),
        ([DOTDIR, "emacs"], [HOME, ".emacs"]),
        ([DOTDIR, "netbeans.conf"], [HOME, ".netbeans","8.1","etc","netbeans.conf"]),

        ([VIMHOME, "vim-pathogen", "autoload", "pathogen"],
            [VIMHOME, "autoload", "pathogen.vim"])
        ]

GIT_REPOS = [
        (BUNDLEDIR,"https://github.com/kien/rainbow_parentheses.vim"),
        (BUNDLEDIR, "https://github.com/sjl/badwolf"),
        (BUNDLEDIR, "https://github.com/tpope/vim-sleuth"),
        (BUNDLEDIR, "https://github.com/vim-syntastic/syntastic"),
        (VIMHOME, "https://github.com/tpope/vim-pathogen"),
        ]

def git_sync(repo):
    '''Clone a git repo or pull'''
    try:
        subprocess.check_call(["git", "clone", repo])
    except subprocess.CalledProcessError as e:
        print(e, e.returncode)

        git_directory = repo.split('/')[-1:][0]

        os.chdir(git_directory)
        subprocess.check_call(["git", "pull"])
        os.chdir(DOTDIR)

def make_dirs(dirlist):
    for d in dirlist:
        try:
            os.mkdir(os.path.join(*d))
        except OSError as e:
            print(e,d)

def install_plugins(repo_pairs):
    for dst,url in repo_pairs:
        os.chdir(dst)
        git_sync(url)

def symlink_dotfiles(link_pairs):
    for src,dst in link_pairs:
        try:
            os.symlink(os.path.join(*src), os.path.join(*dst))
        except OSError as e:
            print(e,src,dst)

if __name__ == '__main__':
    make_dirs(DIRS)
    install_plugins(GIT_REPOS)
    symlink_dotfiles(LINK_MAP)
