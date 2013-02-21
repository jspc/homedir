#!/bin/bash
#
# We run this script to install our home directory
# It checks-out to a build dir and shifts the relevant bollocks about

[ -d $HOME/.build ] && rm -rf $HOME/.build
git clone https://github.com/jspc/homedir.git $HOME/.build

cd $HOME/.build
source $HOME/.build/install/functions.sh

__title "install.sh"

[ -f $HOME/.bash_profile ] && __continue "Your .bash_profile will be replaced"
[ -f $HOME/.bashrc ]       && __continue "Your .bashrc will be replaced"

__msg "Moving directories and files"

# Start shifting stuff over
for dir in $(ls $HOME/.build ); do

    if [ -d $HOME/.build/$dir -a "$dir"!="install" ]; then
	[ -d $HOME/$dir ] || mkdir -v $HOME/$dir
	
	# Only non-hidden
	for entry in $(ls $HOME/.build/$dir); do
	    cp -Rv $HOME/.build/$dir/$entry $HOME/$dir/$entry
	done
    fi
done

cp -vf $HOME/.build/.bash_profile $HOME/
cp -vf $HOME/.build/.bashrc $HOME/
cp -vf $HOME/.build/.status $HOME/
cp -Rv $HOME/.build/.bashables $HOME/.bashables

__msg "Starting the install"

# Build dependencies
bash install/deps.sh

# Ruby/ Perl stuff
bash install/devs.sh

# Do the git stuff
bash install/git.sh

# Platform specifics
case "$(uname)" in
    Darwin )
	bash install/platform.darwin
	;;
    * )
	bash install/platform.linux
	;;
esac

# Gems, etc.
bash install/gems.sh

# Cpan modules
bash install/cpan.sh

# Sys apps
bash install/sys.sh

__msg "Sourcing .bashrc (to mimic login)"
source $HOME/.bashrc

__done "install.sh"
