#!/bin/bash

jump-fzf-fasd-file-search() {
  local file=$(fasd -sf $1 | sort -rn | cut -c 12- | fzf)
  local dir=$(dirname $file)
  if [ -n "$dir" ]; then
    echo "$file"
    cd $dir
  else
    return 1
  fi
}
