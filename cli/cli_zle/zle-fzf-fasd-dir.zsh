zle-fzf-fasd-dir() {
  local dir="$(fasd -sd $1 | sort -rn | cut -c 12- | fzf)"
  if [ -n "$dir" ]; then
    # BUFFER+="cd $dir"
    # zle accept-line
    BUFFER+="$dir"
    CURSOR=${#BUFFER}
  else
    return 1
  fi
}

zle -N zle-fzf-fasd-dir
