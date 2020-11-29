#!/bin/bash

jump-fasd-file-search() {
  if [ $# = 0 ]; then
    fasd -sf
  else
    local file="$(fasd -f $1)"
    local dir="$(dirname $file)"
    if [ -n "$dir" ]; then
      echo "$file"
      cd $dir
    else
      return 1
    fi
  fi
}
