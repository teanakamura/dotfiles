#!/bin/bash

SCRIPT_DIR=`dirname $0`
cd $SCRIPT_DIR
SCRIPT_DIR_ABS=`pwd`
DOT_DIR=$SCRIPT_DIR_ABS/runcoms
cd $DOT_DIR

for f in ?*
do
  [[ "$f" == "git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  echo ".$f"
  ln -snfv "$DOT_DIR/$f" "$HOME/.$f" 
done
cd $SCRIPT_DIR
