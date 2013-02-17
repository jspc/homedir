#!/usr/bin/env bash
#
# CPAN modules we may need

source $HOME/.build/install/functions.sh
__title "cpan.sh"

__msg "Building Fuse.cpan from github"
git clone https://github.com/dpavlin/perl-fuse.git $HOME/projects/perl-fuse
cd  $HOME/projects/perl-fuse
perl Makefile.PL
make
make install
cd -

__msg "FS stuff from CPAN"
cpan Fuse::Simple
cpan Filesys::DiskSpace

__done "cpan.sh"
