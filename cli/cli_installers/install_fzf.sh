#!/bin/bash

mkdir -p ~/.local/share
mkdir -p ~/.local/bin

if [[ ! -e ~/.local/share/fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/share/fzf
  ~/.local/share/fzf/install
  {
    cat <<- EOS
## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

EOS
  } >> ~/.config/shell/rc.local

  {
    cat <<- EOS
if type ag >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
fi
EOS
  } >> ~/.fzf.zsh
fi

if type fzf >/dev/null 2>&1; then
  #ln -s ~/.local/share/fzf/bin/fzf ~/.local/bin
  #ln -s ~/.local/share/fzf/bin/fzf-tmux ~/.local/bin
  ln -s ~/dotfiles/cli/cli_bin/fv ~/.local/bin
  ln -s ~/dotfiles/cli/cli_bin/fga ~/.local/bin

  ln -s ~/dotfiles/cli/cli_bin/fzf-custom-list-add ~/.local/bin
  ln -s ~/dotfiles/cli/cli_bin/fzf-custom-list-remove ~/.local/bin
  {
    cat <<- EOS
## fzf utils
source ~/dotfiles/cli/cli_zle/fzf-custom-list-search.sh
source ~/dotfiles/cli/cli_func/jump-fzf-under
alias ju='jump-fzf-under'
alias cla='fzf-custom-list-add'
alias clr='fzf-custom-list-remove'

EOS
  } >> ~/.config/shell/rc.local
fi
