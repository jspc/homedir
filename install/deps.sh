#!/usr/bin/env bash
#
# Install dependencies

source $HOME/.build/install/functions.sh

__title 'install/deps.sh'
__msg 'Determining build OS'

case "$(uname)" in
    "Darwin" )
	[[ $(which brew) ]] || __err "deps.sh" "You need to install homebrew: http://mxcl.github.com/homebrew/"
	PLATFORM="htop"
	INSTALL_APP="brew"
	INSTALL_CMD="brew install"
	;;
    "Linux" )
	PLATFORM="geany strace lsof less"
	if [[ $(which emerge) ]]; then
	    INSTALL_APP="portage"
	    INSTALL_CMD="emerge"
	elif [[ $(which apt-get ) ]]; then
	    INSTALL_APP="aptitude"
	    INSTALL_CMD="apt-get install -y"
	elif [[ $(which yum) ]]; then
	    INSTALL_APP="yum"
	    INSTALL_CMD="yum install -y"
	else
	    __err "deps.sh" "I've actually not accounted for this distro"
	fi
	;;
    * )
	__err "deps.sh" "Not configured for this OS"
esac

# Build deps

__msg "Installing dependencies with $INSTALL_APP"
__msg "Platform specific packages:"
sudo $INSTALL_CMD $PLATFORM 2>/dev/null

__msg "Final packages:"
for APP in wget readline emacs; do
    sudo $INSTALL_CMD $APP 2>/dev/null
done

__msg "Installing rvm:"
curl -L https://get.rvm.io | bash -s stable --ruby 2>/dev/null

__msg "Installing ruby 1.9.3-p385"
source $HOME/.rvm/scripts/rvm
rvm install 1.9.3-p385
rvm use 1.9.3-p385

__msg "Installing perlbrew"
curl -kL http://install.perlbrew.pl | bash

__msg "Installing Perl 5.16.0"
source ~/perl5/perlbrew/etc/bashrc
perlbrew install perl-5.16.0
perlbrew switch perl-5.16.0

__msg "deps.sh done!\n"