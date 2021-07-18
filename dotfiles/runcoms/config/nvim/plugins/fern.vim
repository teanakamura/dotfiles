nnoremap <C-n> :<C-u>Fern . -reveal=% -drawer -toggle -width=40<CR>

function! s:init_fern() abort
  nmap <buffer> ZZ :<C-u>quit<CR>ZZ
  nmap <buffer> Za :<C-u>quit<CR>Za
  nmap <buffer> ZA :<C-u>quit<CR>ZA
  nmap <buffer> Zq :<C-u>quit<CR>Zq
  nmap <buffer> ZQ :<C-u>quit<CR>ZQ

  nmap <buffer><expr>
   \ <Plug>(my-fern-action-enter-or-open)
   \ fern#smart#leaf(
   \   "\<Plug>(fern-action-open)",
   \   "\<Plug>(fern-action-enter)",
   \ )
  nmap <buffer> L <Plug>(my-fern-action-enter-or-open)
  nmap <buffer> H <Plug>(fern-action-leave)

  nmap <buffer> <C-l> :<C-u>bnext<CR>
  nmap <buffer> <C-h> :<C-u>bprevious<CR>
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END


" "" from dirvish
" "" ref: https://github.com/justinmk/vim-dirvish/blob/4ae4303748221543aaa37030f209da11de817270/plugin/dirvish.vim#L8-L20
" function! s:isdir(dir) abort
"   return !empty(a:dir) && (isdirectory(a:dir)) || (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir))
" endfunction
" 
" augroup fern
"   autocmd!
"   autocmd BufEnter * if s:isdir(expand('%')) | bdelete | redraw | echo 'exec Fern' | sleep 3 | call s:init_fern() | endif
" augroup END


"" from fern-hijack
"" ref: https://github.com/lambdalisue/fern-hijack.vim
if exists('g:loaded_fern_hijack') || ( !has('nvim') && v:version < 801 )
  finish
endif
let g:loaded_fern_hijack = 1

function! s:hijack_directory() abort
  let path = s:expand('%:p')
  if !isdirectory(path)
    return
  endif
  let bufnr = bufnr()
  execute printf('keepjumps keepalt Fern %s', fnameescape(path))
  execute printf('bwipeout %d', bufnr)
endfunction

function! s:suppress_netrw() abort
  if exists('#FileExplorer')
    autocmd! FileExplorer *
  endif
endfunction

function! s:expand(expr) abort
  try
    return fern#util#expand(a:expr)
  catch /^Vim\%((\a\+)\)\=:E117:/
    return expand(a:expr)
  endtry
endfunction

augroup fern-hijack
  autocmd!
  autocmd VimEnter * call s:suppress_netrw()
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END


"" from NERDTree
"" Open Fern with `nvim` only
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * ++nested if argc() == 0 && !exists("s:std_in") | Fern . | endif

