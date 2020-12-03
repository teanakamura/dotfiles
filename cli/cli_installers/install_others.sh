#!/bin/sh

ln -s ~/dotfiles/cli/cli_bin/parse_yaml ~/.local/bin

{
  cat <<- EOS
## bindkey zle
bindkey '^f' vi-find-next-char
bindkey '^b' vi-find-prev-char
bindkey '^u' backward-kill-line

EOS
} >> ~/.local_conf/localrc
