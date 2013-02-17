#!/usr/bin/env bash
#
# CPAN modules we may need

__title "cpan.sh"

__msg "Building Fuse.cpan from github"
git clone https://github.com/dpavlin/perl-fuse.git $HOME/projects/perl-fuse
cd  $HOME/projects/perl-fuse
perl Makefile.PL
make
make install
cd -

__msg "Fuse::Simple from CPAN"
cpan Fuse::Simple

__done "cpan.sh"
