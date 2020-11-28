jump-fzf-z-search() {
  local dir=$(z | sort -rn | cut -c 12- | fzf)
  if [ -n "$dir" ]; then
    BUFFER+="cd $dir"
    zle accept-line
  else
    return 1
  fi
}

zle -N jump-fzf-z-search
bindkey '^j' jump-fzf-z-search
