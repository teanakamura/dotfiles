fzf-custom-list-search() {
  local arr=($(cat ~/.custom_list))
  local res=$(printf "%s\n" "${arr[@]}" | sort -rn | fzf)
  if [ -n "$res" ]; then
    BUFFER+="$res"
  else
    return 1
  fi
}

zle -N fzf-custom-list-search
bindkey '^y' fzf-custom-list-search
