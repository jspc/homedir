#!/usr/bin/env bash
#
# CPAN modules we may need

source $HOME/.build/install/functions.sh
__title "cpan.sh"

source $HOME/perl5/perlbrew/etc/bashrc

__msg "Building Fuse.cpan from github"
git clone https://github.com/dpavlin/perl-fuse.git $HOME/projects/perl-fuse
cd  $HOME/projects/perl-fuse
perl Makefile.PL
make
make install
cd -

__msg "FS stuff from CPAN"
yes '' |cpan Switch
yes '' |cpan Fuse::Simple
yes '' |cpan Filesys::DiskSpace

__done "cpan.sh"
