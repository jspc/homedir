[ -f $HOME/.before_homedir ] && source $HOME/.before_homedir

for file in $(ls $HOME/.bashables); do
    source $HOME/.bashables/$file
done

export PS1='\[\e[36m\]\@\[\e[0m\] \u@\[\e[31m\]\H\[\e[0m\] \[\e[32m\]::\[\e[0m\] \w \[\e[36m\]\$\[\e[0m\] (__git_ps1 "(%s)") '

alias ll="ls -l"
alias la="ls -a"

[ -f $HOME/.after_homedir ] && source $HOME/.after_homedir
