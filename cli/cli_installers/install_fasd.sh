#!/bin/bash

mkdir -p ~/.local/share
mkdir -p ~/.local/bin
mkdir -p ~/.local_conf

if [[ ! -e ~/.local/share/fasd ]]; then
  git clone --depth 1 https://github.com/clvv/fasd.git ~/.local/share/fasd
  cd ~/.local/share/fasd
  PREFIX=$HOME/.local make install
fi

if type fasd >/dev/null 2>&1; then
  {
    cat <<- 'EOS'
## fasd
eval "$(fasd --init zsh-hook)"
alias a='fasd -a'  ## any
alias s='fasd -si'  ## show / search / select
alias d='fasd -d'  ## directory
alias f='fasd -f'  ## file
alias sd='fasd -sid'  ## interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='cd $(fasd -sd | sort -rn | cut -c 12- | fzf)' # cd with fzf for directory
source ~/dotfiles/cli/cli_func/jump-fasd-file-search.sh
alias jf='jump-fasd-file-search'

EOS
  } >> ~/.local_conf/localrc
fi

if type fasd >/dev/null 2>&1; then
  {
    cat <<- 'EOS'
## fasd + fzf
source ~/dotfiles/cli/cli_func/jump-fzf-fasd-file-search.sh
alias jff='jump-fzf-fasd-file-search'

EOS
  } >> ~/.local_conf/localrc
fi
