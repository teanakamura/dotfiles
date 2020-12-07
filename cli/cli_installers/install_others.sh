#!/bin/sh

ln -s ~/dotfiles/cli/cli_bin/parse_yaml ~/.local/bin

{
  cat <<- EOS
## custom function
source ~/dotfiles/cli/cli_func/check_exec_shell.sh

EOS
} >> "~/.config/shell/rc.local"


{
  cat <<- EOS
## bindkey zle
bindkey '^f' vi-find-next-char
bindkey '^b' vi-find-prev-char
bindkey '^u' backward-kill-line

EOS
} >> "~/.config/shell/rc.local"
