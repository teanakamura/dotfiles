#!/bin/bash

mkdir -p ~/.local/share
mkdir -p ~/.local/bin
mkdir -p ~/.local_conf

cd ~/.local/share
if [[ ! -e tig ]]; then
  git clone --depth 1 --branch=release https://github.com/jonas/tig.git
  cd ./tig
  make install install-doc-man prefix=$HOME/.local
fi
