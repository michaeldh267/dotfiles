#!/usr/bin/env python3
# A nice python script that installs my dotfiles and pulls from github

import subprocess
import os

HOME = [os.path.expandvars("$HOME")]
DOTDIR = HOME + ["dotfiles"]
VIMHOME = HOME + [".vim"]
BUNDLEDIR = VIMHOME + ["bundle"]

DIRS = [
        {"dst": BUNDLEDIR },
        {"dst": HOME + [".emacs.d"]},
        {"dst": HOME + ["bin"]},
        ]


LINK_MAP = [
        {"src": DOTDIR + ["Xresources"],    "dst": HOME + [".Xresources"]},
        {"src": DOTDIR + ["bashrc"],        "dst": HOME + [".bashrc.local"]},
        {"src": DOTDIR + ["config.fish"],   "dst": HOME + [".config","fish","config.fish"]},
        {"src": DOTDIR + ["emacs"],         "dst": HOME + [".emacs"]},
        {"src": DOTDIR + ["fonts.conf"],    "dst": HOME + [".config","fontconfig","fonts.conf"]},
        {"src": DOTDIR + ["functions"],     "dst": HOME + [".functions"]},
        {"src": DOTDIR + ["inputrc"],       "dst": HOME + [".inputrc"]},
        {"src": DOTDIR + ["netbeans.conf"], "dst": HOME + [".netbeans","8.1","etc","netbeans.conf"]},
        {"src": DOTDIR + ["netbeans.conf"], "dst": HOME + [".netbeans","8.2","etc","netbeans.conf"]},
        {"src": DOTDIR + ["pythonrc"],      "dst": HOME + [".pythonrc"]},
        {"src": DOTDIR + ["vimrc"],         "dst": HOME + [".vimrc"]},

        {"src": VIMHOME + ["vim-pathogen", "autoload", "pathogen"],
            "dst": VIMHOME + ["autoload", "pathogen.vim"]}
        ]

GIT_REPOS = [
        {"dst": BUNDLEDIR, "giturl": "https://github.com/kien/rainbow_parentheses.vim"},
        {"dst": BUNDLEDIR, "giturl": "https://github.com/sjl/badwolf"},
        {"dst": BUNDLEDIR, "giturl": "https://github.com/tpope/vim-sleuth"},
        {"dst": BUNDLEDIR, "giturl": "https://github.com/vim-syntastic/syntastic"},
        {"dst": VIMHOME,   "giturl": "https://github.com/tpope/vim-pathogen"},
        ]

def git_sync(repo):
    '''Clone a git repo or pull'''
    try:
        subprocess.check_call(["git", "clone", repo])
    except subprocess.CalledProcessError as e:
        #print(e, e.returncode)
        print(e)

        git_directory = repo.split('/')[-1:][0]

        os.chdir(git_directory)
        subprocess.check_call(["git", "pull"])


def make_dirs(arglist):
    for arg in arglist:
        try:
            os.mkdir(os.path.join(arg))
        except OSError as e:
            print(e)

def make_dir_list(*args):
    dir_list = []
    for arg in args:
        for path in arg:
            if "dst" in path:
                dir_list.append(os.path.join(*path.get("dst")[0:-1]))

    return sorted(list(set(dir_list)))

def install_plugins(repolist):
    for repo in repolist:
        if "dst" in repo and "giturl" in repo:
            os.chdir(os.path.join(*repo.get("dst")))
            git_sync(repo.get("giturl"))

def symlink_dotfiles(linklist):
    for link in linklist:
        if "src" in link and "dst" in link:
            try:
                os.symlink(os.path.join(*link.get("src")),
                           os.path.join(*link.get("dst")))
            except OSError as e:
                print(e)

if __name__ == '__main__':
    make_dirs(make_dir_list(LINK_MAP, GIT_REPOS, DIRS))
    install_plugins(GIT_REPOS)
    symlink_dotfiles(LINK_MAP)
