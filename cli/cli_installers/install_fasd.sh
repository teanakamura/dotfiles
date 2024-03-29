#!/bin/bash

mkdir -p ~/.local/share
mkdir -p ~/.local/bin

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

## fasd utils
# alias a='fasd -a'  ## any
# alias s='fasd -si'  ## show / search / select
# alias d='fasd -d'  ## directory
# alias f='fasd -f'  ## file
# alias sd='fasd -sid'  ## interactive directory selection
# alias sf='fasd -sif'  ## interactive file selection
alias vf='fasd -f -e nvim'
source ~/dotfiles/cli/cli_func/fasd_cd.sh
alias j='fasd_cd -d'  ## cd, same functionality as j in autojump
source ~/dotfiles/cli/cli_func/jump-fasd-file-search.sh
alias jj='jump-fasd-file-search'

EOS
  } >> ~/.config/shell/rc.local
fi

if type fasd >/dev/null 2>&1; then
  {
    cat <<- 'EOS'
## fasd + fzf utils
# alias jd='cd $(fasd -sd | sort -rn | cut -c 12- | fzf)'  ## cd with fzf for directory
source ~/dotfiles/cli/cli_func/fasd-file-fzf
alias ff='fasd-file-fzf'
source ~/dotfiles/cli/cli_func/jump-fzf-fasd-directory-search.sh
alias jd='jump-fzf-fasd-directory-search'
source ~/dotfiles/cli/cli_func/jump-fzf-fasd-file-search.sh
alias jf='jump-fzf-fasd-file-search'

## fasd + fzf zle
source ~/dotfiles/cli/cli_zle/zle-fzf-fasd-file.zsh
bindkey '^O' zle-fzf-fasd-file
source ~/dotfiles/cli/cli_zle/zle-fzf-fasd-dir.zsh
bindkey '^T' zle-fzf-fasd-dir

EOS
  } >> ~/.config/shell/rc.local
fi
