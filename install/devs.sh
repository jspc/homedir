#!/usr/bin/env bash
#
# Largely perl and ruby

source $HOME/.build/install/functions.sh

__title "devs.sh"

__msg "Installing rbenv"
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p  ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

__msg "Installing ruby 1.9.3-p385"
if [ -f $HOME/.rbenv/bin/rbenv ]; then
    export PATH="${HOME}/.rbenv/bin:${PATH}"
    eval "$(rbenv init -)"
fi
rbenv install 1.9.3-p385
rbenv global 1.9.3-p385

__msg "Installing perlbrew"
curl -kL http://install.perlbrew.pl | bash

__msg "Installing Perl 5.16.0"
source $HOME/perl5/perlbrew/etc/bashrc
perlbrew install perl-5.16.0 -Dusethreads
perlbrew switch perl-5.16.0

__done "devs.sh"