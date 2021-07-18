"default : <Leader><Leader>w <Plug>(easymotion-w) -> j w
" j:下の範囲 / k:上の範囲 / bd:bidirectional
" w:word / jk:line / f:char


" <Leader>f{char} or s{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)
map  s <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap S <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
