## installation
```sh
## base
cd dotfiles/dotfiles
source install.sh
```
```sh
## zsh
cd ../zprezto
zsh
source zprezto_install.sh
chsh -s <zsh_path>
```
```sh
## neovim
## install neovim
## https://github.com/neovim/neovim/wiki/Installing-Neovim
```
```sh
## dein(neovim package manager)
cd ~/.cache
mkdir dein
source dein_installer.sh ~/.cache/dein
```
```vim
"" neovimを起動して
:checkhealth
:call dein#install()
:call dein#remote_plugins()  "python3のpynvimが必要
```

## 参考
* `cat /etc/shells` 
* `echo $SHELL`
