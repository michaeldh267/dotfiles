#!/usr/bin/env perl

use warnings;
use strict;
use v5.24;
use Cwd;

use File::Spec;
use File::Spec::Functions qw(rootdir);

sub git_sync {

    my $url = shift @_;

    if (system("git", "clone", $url ) == 0) {
        return;
    } else {
        my @chunks = split(/\//, $url);
        say (join " ", @chunks);
        my $name = $chunks[4];
        chdir $name;
        system("git", "pull") == 0
            or die $?;
        chdir ".."
            or die $?;
    }
    #say ($? >> 8);
}


my $repos = [
    "https://github.com/vim-syntastic/syntastic",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/tpope/vim-sleuth",
    "https://github.com/sjl/badwolf",
    "https://github.com/jceb/vim-orgmode",
    "https://github.com/tpope/vim-speeddating",
    ];


#chdir(File::Spec->catdir(rootdir(),"home", "myk", "dotfiles")) or die;
chdir(File::Spec->catdir(rootdir(),"home", "myk", ".vim", "bundle")) or die;
my $dir = getcwd();
say $dir;
for my $x (@{$repos}) {
    git_sync($x);
}
