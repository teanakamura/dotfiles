#!/bin/bash

CURRENT=`pwd`
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
  
  if [[ "$f" == "cache" ]] || [[ "$f" == "config" ]]
  then
    cd $f
    mkdir $HOME/.$f
    for nest in ?*
    do
      [[ -d "$HOME/.$f/$nest" ]] && mv "$HOME/.$f/$nest" "$HOME/.$f/${nest}_mv"
      ln -snfv "$DOT_DIR/$f/$nest" "$HOME/.$f/$nest"
    done
    cd ../
    continue
  fi 

  ln -snfv "$DOT_DIR/$f" "$HOME/.$f" 
done
cd $CURRENT
