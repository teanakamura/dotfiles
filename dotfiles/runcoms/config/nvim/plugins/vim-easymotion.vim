"" default : <Leader><Leader>w <Plug>(easymotion-w) -> j w


" "" s{char}             : map {char}s for jump
" "" S{char}{char}       : map {char}{char} for jump
" "" <Leader>S{char}*<CR>: map {char}* for jump
" nmap s <Plug>(easymotion-overwin-f)
" vmap s <Plug>(easymotion-bd-f)
" nmap S <Plug>(easymotion-overwin-f2)
" vmap S <Plug>(easymotion-bd-f2)
" nmap <Leader>s <Plug>(easymotion-sn)
" vmap <Leader>s <Plug>(easymotion-sn)


"" <Leader>L: map line for jump
nmap <Leader>L <Plug>(easymotion-overwin-line)
vmap <Leader>L <Plug>(easymotion-bd-jk)


"" <Leader>w: map line for jump
nmap <Leader>w <Plug>(easymotion-iskeyword-w)
vmap <Leader>w <Plug>(easymotion-iskeyword-w)
nmap <Leader>b <Plug>(easymotion-iskeyword-b)
vmap <Leader>b <Plug>(easymotion-iskeyword-b)


"" f{char}              : jump next {char}
"" F{char}              : jump prev {char}
"" <Leader>f{char}{char}: jump next {char}{char}
"" <Leader>F{char}{char}: jump prev {char}{char}
"" ;                    : jump next like as the prev jump
"" ,                    : jump prev like as the prev jump

function F_jump(num_char, dir)
  let s:dir = a:dir
  if a:num_char == 1 && a:dir == 1
    exec "normal \<Plug>(easymotion-f)".nr2char(getchar())."a"
  elseif a:num_char == 1 && a:dir == 0
    exec "normal \<Plug>(easymotion-F)".nr2char(getchar())."a"
  elseif a:num_char == 2 && a:dir == 1
    exec "normal \<Plug>(easymotion-f2)".nr2char(getchar()).nr2char(getchar())."a"
  elseif a:num_char == 2 && a:dir == 0
    exec "normal \<Plug>(easymotion-F2)".nr2char(getchar()).nr2char(getchar())."a"
  endif
endfunction

"" disable <Plug>(easymotion-next), <Plug>(easymotion-prev) highlight
let g:EasyMotion_move_highlight = 0
function Jump_like_as_prev_jump(dir)
  if !xor(s:dir, a:dir) == 1
    exec "normal \<Plug>(easymotion-next)"
  elseif !xor(s:dir, a:dir) == 0
    exec "normal \<Plug>(easymotion-prev)"
  endif
endfunction
if dein#check_install('vim-submode') != 0
  inoremap <C-]> <C-o>:<C-u>call Jump_like_as_prev_jump(1)<CR>
endif

" nmap f :<C-u>exec "normal \<Plug>(easymotion-f)".nr2char(getchar())."a"<CR>
" nmap F :<C-u>exec "normal \<Plug>(easymotion-F)".nr2char(getchar())."a"<CR>
" nmap <Leader>f :exec "normal \<Plug>(easymotion-f2)".nr2char(getchar()).nr2char(getchar())."a"<CR>
" nmap <Leader>F :exec "normal \<Plug>(easymotion-F2)".nr2char(getchar()).nr2char(getchar())."a"<CR>
" nmap ; <Plug>(easymotion-next)
" nmap , <Plug>(easymotion-prev)
" nnoremap <silent> f :<C-u>call F_jump(1, 1)<CR>
" onoremap <silent> f :<C-u>call F_jump(1, 1)<CR>
" inoremap <silent> <A-f> <C-o>:<C-u>call F_jump(1, 1)<CR>
" nnoremap <silent> F :<C-u>call F_jump(1, 0)<CR>
" onoremap <silent> F :<C-u>call F_jump(1, 0)<CR>
" inoremap <silent> <A-b> <C-o>:<C-u>call F_jump(1, 0)<CR>
" nnoremap <silent> <Leader>f :<C-u>call F_jump(2, 1)<CR>
" onoremap <silent> <Leader>f :<C-u>call F_jump(2, 1)<CR>
" nnoremap <silent> <Leader>F :<C-u>call F_jump(2, 0)<CR>
" onoremap <silent> <Leader>F :<C-u>call F_jump(2, 0)<CR>
" nnoremap <silent> ; :<C-u>call Jump_like_as_prev_jump(1)<CR>
" nnoremap <silent> , :<C-u>call Jump_like_as_prev_jump(0)<CR>
