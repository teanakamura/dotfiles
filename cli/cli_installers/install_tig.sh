#!/bin/bash

mkdir -p ~/.local/share
mkdir -p ~/.local/bin
mkdir -p ~/.local_conf

if [[ ! -e ~/.local/share/tig ]]; then
  git clone --depth 1 --branch=release https://github.com/jonas/tig.git ~/.local/share/tig
  cd ~/.local/share/tig
  make install install-doc-man prefix=$HOME/.local
fi
