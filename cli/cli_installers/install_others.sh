#!/bin/sh

ln -s ~/dotfiles/cli/cli_bin/parse_yaml ~/.local/bin

{
  cat <<- EOS
## custom function
source ~/dotfiles/cli/cli_func/check_exec_shell.sh

## custom zle
bindkey '^u' backward-kill-line
# bindkey '^s' xxx
# bindkey '^y' xxx
bindkey '^[f' vi-find-next-char
bindkey '^[F' vi-find-prev-char
bindkey '^[n' vi-repeat-find
bindkey '^[N' vi-rev-repeat-find
bindkey '^[h' emacs-forward-word
bindkey '^[l' emacs-backward-word

EOS
} >> ~/.config/shell/rc.local
