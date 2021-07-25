## installation

#### symlinks
```sh
cd dotfiles/dotfiles
./install.sh
```

#### zsh
```sh
cd ../zprezto
zsh
source zprezto_install.sh
chsh -s <zsh_path>
```

#### neovim
```sh
## neovim
## install neovim
## https://github.com/neovim/neovim/wiki/Installing-Neovim
## enable 'nvim' command
```
```sh
## dein(neovim package manager)
cd ~/.cache
mkdir dein
./dein_installer.sh ~/.cache/dein

## python3 for neovim
mkdir ~/venv
cd ~/venv
python3 -m venv neovim
source ./neovim/bin/activate
pip install --upgrade pip
pip install pynvim
echo 'export PYTHON3_BIN_PATH=~/venv/neovim/bin/python3' >> ~/.config/shell/rc.local
source ~/.config/shell/rc.local

## pypi for vim-lsp
mkdir ~/.cache/vim-lsp
pip install flake8 pyls-mypy pyls-isort pyls-black
(pip install future)
deactivate

```vi
"" neovimを起動して
:checkhealth
:call dein#install()
:call dein#remote_plugins()  "python3のpynvimが必要
```

#### CLI
```sh
cd dotfiles/cli/cli_installers
source install_fzf.sh
## fzfの起動確認
source install_fasd.sh
source install_tig.sh
source install_others.sh
```

## 参考
* `cat /etc/shells` 
* `echo $SHELL`
