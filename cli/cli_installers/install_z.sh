#!/bin/bash

mkdir -p ~/.local/share
mkdir -p ~/.local/bin

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
  } >> "~/.config/shell/rc.local"
fi

if type z >/dev/null 2>&1 && type fzf > /dev/null 2>&1; then
  {
    cat <<- EOS
## fzf + z utils
source ~/dotfiles/cli/cli_zle/jump-fzf-z-search.sh

EOS
  } >> "~/.config/shell/rc.local"
fi
