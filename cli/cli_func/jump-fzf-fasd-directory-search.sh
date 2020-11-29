#!/bin/bash

jump-fzf-fasd-directory-search() {
  local dir="$(fasd -sd $1 | sort -rn | cut -c 12- | fzf)"
  if [ -n "$dir" ]; then
    echo "$dir"
    cd $dir
  else
    return 1
  fi
}
