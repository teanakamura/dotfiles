zle-fzf-fasd-dir() {
  local dir="$(fasd -sd $1 | sort -rn | cut -c 12- | fzf)"
  if [ -n "$dir" ]; then
    BUFFER+="$dir"
    # BUFFER+="cd $dir"
    # zle accept-line
  else
    return 1
  fi
}

zle -N zle-fzf-fasd-dir
