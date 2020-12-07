#!/bin/bash

function h_load_yaml () {
  ROOT_PATH=$1
  source ~/dotfiles/cli/cli_func/pathlib.bash
  str_split $(path_get_relative $ROOT_PATH $2) '/' 'REL_PATH_ARR'
  echo "YAML LOADING PATH ARRAY: ${REL_PATH_ARR[@]}"

  yml_path=$ROOT_PATH
  i=0
  while [ $i -lt ${#REL_PATH_ARR[@]} ]; do
    if [ -f "${yml_path}/default.yml" ]; then
      echo "LOAD ${yml_path}/default.yml"
      eval $(parse_yaml "${yml_path}/default.yml")
    fi
    yml_path="${yml_path}/${REL_PATH_ARR[$i]}"
    i=`expr $i + 1`
  done
  echo "LOAD $yml_path"
  eval $(parse_yaml ${yml_path/default.yml})
}
