nnoremap dt :<C-u>Deol -split=floating<CR>
nnoremap dv :<C-u>Deol -split=vertical<CR>
nnoremap ds :<C-u>Deol -split=horizontal<CR>

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

