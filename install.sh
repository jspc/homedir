#!/bin/bash
#
# We run this script to install our home directory
# It checks-out to a build dir and shifts the relevant bollocks about

[ -d $HOME/.build ] && rm -rf $HOME/.build
git clone git@github.com:jspc/homedir.git $HOME/.build

cd $HOME/.build
source install/funtions.sh

__title "install.sh"

[ -f $HOME/.bash_profile ] && __continue "Your .bash_profile will be replaced"
[ -f $HOME/.bashrc       ] && __continue "Your .bashrc will be replaced"

__msg "Moving directories and files"

# Start shifting stuff over
for dir in $(ls -a $HOME/.build ); do
    [[ "$dir"="install" ]] && continue
    if [ -d $HOME/.build/$dir ]; then
	[ -d $HOME/$dir ] || mkdir -v $HOME/$dir
	
	# Only non-hidden
	for entry in $(ls $HOME/.build/$dir); do
	    cp -Rv $HOME/.build/$dir/$entry $HOME/$dir/$entry
	done
    fi
done

cp -vf $HOME/.build/.bash_profile $HOME/
cp -vf $HOME/.build/.bbashrc $HOME/

__msg "Starting the install"

# Build dependencies
bash install/deps.sh

# Do the git stuff
bash install/git.sh

# Gems, etc.
bash install/gems.sh

__msg "Sourcing .bashrc (to mimic login)"
source .bashrc

__done "install.sh"