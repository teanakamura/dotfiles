#!/bin/sh

ln -s ~/dotfiles/cli/cli_bin/parse_yaml ~/.local/bin

{
  cat <<- EOS
## custom function
source ~/dotfiles/cli/cli_func/check_exec_shell.sh

## custom alias
alias d='dirs -v'

## custom zle
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
#bindkey '^f' vi-find-next-char
#bindkey '^b' vi-find-prev-char
#bindkey '^s' vi-find-next-char
bindkey '^u' backward-kill-line
bindkey '^[f' vi-find-next-char
# bindkey '^S' vi-find-next-char
bindkey '^[F' vi-find-prev-char
# bindkey '^X^X' vi-find-prev-char
bindkey '^[n' vi-repeat-find
# bindkey '^Y' vi-repeat-find
bindkey '^[N' vi-rev-repeat-find
bindkey '^[h' emacs-forward-word
bindkey '^[l' emacs-backward-word
bindkey -M isearch '^S' history-incremental-search-forward
bindkey -M isearch '^R' history-incremental-search-backward

EOS
} >> ~/.config/shell/rc.local
