etopt EXTENDED_GLOB
ZPREZTODIR=$HOME/dotfiles
for rcfile in "${ZPREZTODIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
