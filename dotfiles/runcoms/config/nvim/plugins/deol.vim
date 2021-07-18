nnoremap dF :<C-u>Deol -split=floating<CR>
" nnoremap dv :<C-u>Deol -split=vertical<CR>
nnoremap dh :<C-u>Deol -split=horizontal<CR>
nnoremap dc :<C-u>Deol<CR><C-\><C-n><C-w>T

augroup MyDeol
  autocmd!
  autocmd FileType deol call s:configure_deol()
augroup END

function! s:configure_deol() abort
  nmap <buffer> <C-z> <Nop>
  nmap <buffer> dT <Plug>(deol_bg)
  nmap <buffer> <C-c> :<C-u>quit<CR>
  "imap <buffer> <C-t> <Plug>(deol_bg)
  "nmap dT :<C-u>call deol#new({})<CR>
endfunction

