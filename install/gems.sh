#!/usr/bin/env bash
#
# Run through every Gemfile and do a bundle
# Then pick up a coupld of our gems

source $HOME/.build/install/functions.sh
__title "gems.sh"

# Weird gentoo bug
unset RUBYOPT

__msg "Looking for Gemfiles"
for dir in $(find $HOME/projects -name Gemfile 2>/dev/null); do 
    BASE=$(dirname $dir)
    __msg "Installing Gemfile for $BASE"
    cd $BASE
    yes 'n' | bundle # For .rvmrc warnings
    cd - &>/dev/null
done

__msg "Installing various gems from rubygems"
gem install lodestone
gem install ddis

__done "gems.sh"
