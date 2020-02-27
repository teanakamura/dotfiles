#!/bin/bash

mkdir -p ~/.local/share
mkdir -p ~/.local/bin
mkdir -p ~/.local_conf

cd ~/.local/share
if [[ ! -e fzf ]]; then
  git clone -depth 1 https://github.com/junegunn/fzf.git
  cd ./fzf/install
  echo '[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh' >> ~/.local_conf/localrc
  #ln -s ~/.local/share/fzf/bin/fzf ~/.local/bin
  #ln -s ~/.local/share/fzf/bin/fzf-tmux ~/.local/bin
  ln -s ~/dotfiles/cli/cli_bin/fv ~/.local/bin
  ln -s ~/dotfiles/cli/cli_bin/fga ~/.local/bin
fi
