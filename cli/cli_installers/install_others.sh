#!/bin/sh

ln -s ~/dotfiles/cli/cli_bin/parse_yaml ~/.local/bin

{
  cat <<- EOS
## custom function
source ~/dotfiles/cli/cli_func/check_exec_shell.sh

## custom alias
alias d='dirs -v'

## custom zle
#bindkey '^f' vi-find-next-char
#bindkey '^b' vi-find-prev-char
#bindkey '^s' vi-find-next-char
bindkey '^u' backward-kill-line
bindkey '^[f' vi-find-next-char
bindkey '^[b' vi-find-prev-char
bindkey '^S' vi-find-next-char
bindkey '^X^X' vi-find-prev-char
bindkey '^Y' vi-repeat-find

EOS
} >> ~/.config/shell/rc.local
