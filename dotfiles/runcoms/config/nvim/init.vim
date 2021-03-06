if &compatible
  set nocompatible               " Be iMproved
endif

"" Add the .vimrc
runtime vimrc

"" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

"" Specify python path
let g:python3_host_prog = $PYTHON3_BIN_PATH

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  "" Let dein manage dein
  "" 適宜 call dein#install()
  "" 適宜 call dein#update()
  "" 適宜 call dein#clear_state()
  " call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  let s:toml = '~/.config/nvim/dein/dein.toml'
  let s:lazy_toml_vim_enter = '~/.config/nvim/dein/dein_lazy_vim_enter.toml'
  let s:lazy_toml = '~/.config/nvim/dein/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_vim_enter, {'lazy': 1})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()

  "" caching
  "" cacheが不要ならload_stateやsave_stateは呼ばない
  call dein#save_state()
endif

"" Required:
filetype plugin indent on

"" If you want to install not installed plugins on startup automatically.
"if dein#check_install()
"  call dein#install()
"endif
