#!/bin/bash
#
# We run this script to install our home directory
# It checks-out to a build dir and shifts the relevant bollocks about

__continue(){
    local question
    question=$1
    echo "$1"
    read -p "[enter] or [ctrl+c]"
}

[ -d $HOME/.build ] && rm -rf $HOME/.build
git clone git@github.com $HOME/.build

[ -f $HOME/.homedir_profile ] && __continue "Your .homedir_profile will be replaced"

# Start shifting stuff over
for dir in $(ls -a $HOME/.build ); do

    if [ -d $HOME/.build/$dir ]; then
	[ -d $HOME/$dir ] || mkdir -v $HOME/$dir
	
	# Only non-hidden
	for entry in $(ls $HOME/.build/$dir); do
	    cp -Rv $HOME/.build/$dir/$entry $HOME/$dir/$entry
	done
    fi
done


# Do the various scripts
cp -vf $HOME/.build/.homedir_profile $HOME/
[[ $(grep homedir_profile $HOME/.bash_profile) ]] || echo -e "\ntouch $HOME/.homedir_profile\n" >> $HOME/.bash_profile 


# Checkout my projects
