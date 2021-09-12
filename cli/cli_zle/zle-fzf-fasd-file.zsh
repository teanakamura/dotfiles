zle-fzf-fasd-file() {
  local file="$(fasd -sf $1 | sort -rn | cut -c 12- | fzf)"
  if [ -n "$file" ]; then
    BUFFER+="$file"
    # BUFFER+="cd $dir"
    # zle accept-line
  else
    return 1
  fi
}

zle -N zle-fzf-fasd-file
