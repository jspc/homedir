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
	    INSTALL_CMD="sudo  emerge"
	elif [[ $(which apt-get ) ]]; then
	    INSTALL_APP="aptitude"
	    INSTALL_CMD="sudo apt-get install -y"
	elif [[ $(which yum) ]]; then
	    INSTALL_APP="yum"
	    INSTALL_CMD="sudo yum install -y"
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
$INSTALL_CMD $PLATFORM 2>/dev/null

__msg "Final packages:"
for APP in wget readline emacs; do
    $INSTALL_CMD $APP 2>/dev/null
done

__msg "deps.sh done!\n"