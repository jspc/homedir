source .status

[ -f $HOME/.before_homedir ] && source $HOME/.before_homedir

for file in $(ls $HOME/.bashables); do
    source $HOME/.bashables/$file
done

if [ "$USER" == "root" ]; then
    export PS1='$(__status) \[\e[35m\]\u@\[\e[31m\]\H\[\e[0m\] \[\e[32m\]::\[\e[0m\] \w \[\e[36m\]\$\[\e[0m\]$(__git_ps1 "(%s)") '
else
    export PS1='$(__status) \u@\[\e[31m\]\H\[\e[0m\] \[\e[32m\]::\[\e[0m\] \w \[\e[36m\]\$\[\e[0m\]$(__git_ps1 "(%s)") '
fi

alias ll="ls -l"
alias la="ls -a"

source $HOME/perl5/perlbrew/etc/bashrc
[ -f $HOME/.rvm/scripts/rvm ]     && source $HOME/.rvm/scripts/rvm
[ -f /usr/local/rvm/scripts/rvm ] && source /usr/local/rvm/scripts/rvm


export BIN=$HOME/bin
export LIB=$HOME/lib
export LOG=$HOME/log
export TMP=$HOME/tmp
export PROJECTS=$HOME/projects
export SYS=$HOME/sys
export CSI=$SYS/csi

export PATH=$BIN:$PATH

[ -f $HOME/.after_homedir ] && source $HOME/.after_homedir
