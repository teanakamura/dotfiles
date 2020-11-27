#!/bin/bash

mkdir -p ~/.local/share
mkdir -p ~/.local/bin
mkdir -p ~/.local_conf

if [[ ! -e ~/.local/share/z ]]; then
  git clone --depth 1 https://github.com/rupa/z.git ~/.local/share/z
fi

if type z >/dev/null 2>&1; then
  {
    cat <<- EOS
## z
[ -f ~/.local/share/z/z.sh ] && source ~/.local/share/z/z.sh
alias j=z

EOS
  } >> ~/.local_conf/localrc
fi

if type z >/dev/null 2>&1 && type fzf > /dev/null 2>&1; then
  {
    cat <<- EOS
## fzf + z utils
source ~/dotfiles/cli/cli_zle/fzf-z-search.sh

EOS
  } >> ~/.local_conf/localrc
fi
