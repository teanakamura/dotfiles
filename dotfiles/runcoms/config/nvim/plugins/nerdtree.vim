"" Open NERDTree with `nvim` not `nvim <file>`
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" KeyMapping
nnoremap [nerdtree] <Nop>
nmap <C-n> [nerdtree]
nnoremap [nerdtree] :<C-u>NERDTreeToggle<CR>
