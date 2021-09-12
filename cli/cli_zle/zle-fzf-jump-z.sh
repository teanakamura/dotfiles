zle-fzf-jump-z() {
  local dir=$(z | sort -rn | cut -c 12- | fzf)
  if [ -n "$dir" ]; then
    BUFFER+="cd $dir"
    zle accept-line
  else
    return 1
  fi
}

zle -N zle-fzf-jump-z
