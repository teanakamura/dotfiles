zle-fzf-custom-list() {
  local arr=($(cat ~/.custom_list))
  local res=$(printf "%s\n" "${arr[@]}" | sort -rn | fzf)
  if [ -n "$res" ]; then
    BUFFER+="$res"
  else
    return 1
  fi
}

zle -N zle-fzf-custom-list
