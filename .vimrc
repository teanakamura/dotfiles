set nocompatible
set encoding=utf-8
set cursorline
"set cursorcolumn
set virtualedit=block,onemore
set showcmd

"----------------------------
" 検索
"----------------------------
" 検索結果をハイライト
set hlsearch

"----------------------------
" 表示
"----------------------------
" 対応する括弧をハイライト
set showmatch matchtime=1
" 不可視文字を表示する
" set list
set listchars=tab:~\ ,trail:~

set laststatus=2
hi Comment ctermfg=3
" タブをスペースに変換
set expandtab
" タブ入力時のスペースの数
set softtabstop=2
" タブの表示幅
set tabstop=2
" 自動インデントのスペース幅
set shiftwidth=2
set guioptions+=a
set smartindent
set cindent
set number
syntax enable
set clipboard=unnamed,autoselect
set mouse=a

"----------------------------
" 変更補助
"----------------------------
set backspace=indent,eol,start

