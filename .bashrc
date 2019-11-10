alias ll='ls -lh'
alias la='ls -a'
alias ..='cd ..'
alias bd='cd -' #back directory
alias python='python3'
alias pip='pip3'
alias activate='source ./bin/activate'
alias relogin='exec $SHELL -l'
alias open='open .'
alias jn='jupyter notebook'
alias 'pf-lab-jn'='ssh -L 3333:localhost:3333 athena -t ssh -L 3333:localhost:3333 nike'
  # portforwarding labratory jupyter notebook server
alias diff='diff -y'
alias cdiff='colordiff -y'
alias cdiffscl='colordiff -y --suppress-common-lines'
alias less='less -R'
alias du='du -h'

export PYHTONPATH=$PYTHTONPATH:~/Excercise/python/venv/machine_learning/
