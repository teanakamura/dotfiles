" unmap default key mappings
nmap gc <Nop>
vmap gc <Nop>

" 行の最初の文字の前にコメント文字をトグル
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
" 行頭にコメントをトグル
nmap <Leader>C <Plug>(caw:zeropos:toggle)
vmap <Leader>C <Plug>(caw:zeropos:toggle)
