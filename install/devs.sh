#!/usr/bin/env bash
#
# Largely perl and ruby

source $HOME/.build/install/functions.sh

__title "devs.sh"

__msg "Installing rvm:"
curl -L https://get.rvm.io | bash -s stable --ruby 2>/dev/null

__msg "Installing ruby 1.9.3-p385"
[ -f $HOME/.rvm/scripts/rvm ]     && source $HOME/.rvm/scripts/rvm
[ -f /usr/local/rvm/scripts/rvm ] && source /usr/local/rvm/scripts/rvm

rvm install 1.9.3-p385
rvm use 1.9.3-p385

__msg "Installing perlbrew"
curl -kL http://install.perlbrew.pl | bash

__msg "Installing Perl 5.16.0"
source ~/perl5/perlbrew/etc/bashrc
perlbrew install perl-5.16.0
perlbrew switch perl-5.16.0

__done "devs.sh"