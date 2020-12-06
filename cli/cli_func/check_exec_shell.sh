#!/bin/sh
function check_exec_shell() {
  if [ -n "$(echo $(ps -h -p $$ -o command) | grep $1)" ]; then
    return 0
  else
    return 1
  fi
}


