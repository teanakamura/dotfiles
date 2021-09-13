#!/bin/zsh

zle-fzf-custom-list() {
  local f=~/.custom_list
  local lines=("${(@f)$(egrep "$2" "$f")}")
  local res=$(printf "%s\n" "${lines[@]}" | sort -rn | fzf)
  if [ -n "$res" ]; then
    BUFFER+="$res"
    CURSOR=${#BUFFER}
  else
    return 1
  fi
}

zle -N zle-fzf-custom-list
