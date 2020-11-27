fzf-z-search() {
  local dir=$(z | sort -rn | cut -c 12- | fzf)
  if [ -n "$dir" ]; then
    BUFFER+="cd $dir"
    zle accept-line
  else
    return 1
  fi
}

zle -N fzf-z-search
bindkey '^j' fzf-z-search
