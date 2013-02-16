#!/usr/bin/env bash
#
# Install git repos

source $HOME/.build/install/functions.sh

__title "git.sh"

__msg "Getting jspc repos from github"
REPOS=$(curl https://api.github.com/users/jspc/repos 2>/dev/null| grep "clone_url" | awk -F: '{ print substr($0, index($0,$2)) "\n"}')
NUMBER=$(for TMP_REPO in $REPOS; do echo $TMP_REPO; done | wc -l)
__msg "Got $NUMBER repos"

for REPO in $REPOS; do 
    CLONE_PATH="$HOME/projects/$(echo $REPO | sed 's/,//g' | awk -F/ '{print $NF}' | awk -F. '{print $1}')"
    REPO_CLEAN="$(echo $REPO | sed 's/,//g' | sed 's/\"//g')"
    if [ ! -d $CLONE_PATH ]; then
	__msg "Cloning $REPO_CLEAN to $CLONE_PATH"
	git clone $REPO_CLEAN $CLONE_PATH
    fi
done

__done "git.sh"