#!/bin/bash

DOTPATH=~/dotfiles/.dotfiles

cd .dotfiles
for f in ?*
do
  [[ "$f" == "git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  echo ".$f"
  ln -snfv "$DOTPATH/$f" "$HOME/.$f" 
done
cd ..
