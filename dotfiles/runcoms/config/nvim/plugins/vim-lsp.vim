" diagnostic
let g:lsp_auto_enable = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}
let g:lsp_virtual_text_enabled = 1
let g:lsp_fold_enabled = 0

"highlight
hi LspErrorVirtualText guifg=blue
hi LspWarningVirtualText guifg=blue
hi LspInformationVirtualText guifg=blue
hi LspHintVirtualText guifg=blue


" dubug
" let g:lsp_log_verbose = 0  " デバッグ用ログを出力
" let g:lsp_log_file = expand('~/.cache/vim-lsp/vim-lsp.log')  " ログ出力のPATHを設定
let g:lsp_log_file = expand('')  " ログ出力のPATHを設定

" configurations of each language server
let g:lsp_buffer_diagnostics_enabled = 0  " custom variable
function! ToggleDiagnostics() abort
  " if !g:lsp_diagnostics_enabled
  "   let g:lsp_diagnostics_enabled = !g:lsp_diagnostics_enabled
  "   call lsp#enable()
  " endif
  let g:lsp_buffer_diagnostics_enabled = !g:lsp_buffer_diagnostics_enabled
  if g:lsp_buffer_diagnostics_enabled
    call lsp#enable_diagnostics_for_buffer()
  else
    call lsp#disable_diagnostics_for_buffer()
  endif
endfunction

function! s:on_lsp_buffer_enabled() abort
  if !g:lsp_buffer_diagnostics_enabled
    call lsp#disable_diagnostics_for_buffer()
  endif
  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
  setlocal nofoldenable
  setlocal
    \ foldlevel=99
    \ foldmethod=expr
    \ foldexpr=lsp#ui#vim#folding#foldexpr()
    \ foldtext=lsp#ui#vim#folding#foldtext()
  " LSP用にマッピング
  nnoremap <buffer> K :<C-u>LspHover<CR>
  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
  nnoremap <buffer> gd :<C-u>LspPeekDefinition<CR>
  nnoremap <buffer> gD :<C-u>LspReferences<CR>
  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
  nnoremap <buffer> gq :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gq :<C-u>LspDocumentRangeFormat<CR>
  nnoremap <buffer> gR :<C-u>LspRename<CR>
  " nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
  nnoremap <buffer> gL :<C-u>call ToggleDiagnostics()<CR>
  nnoremap <buffer> zr :<C-u>LspDocumentFold<CR>
  nnoremap <buffer> zR :<C-u>LspDocumentFoldSync<CR>
endfunction

augroup MyLsp
  autocmd!
  "" 有効化設定
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

  "" lazy loadされた場合の手動起動設定
  autocmd FileType python call lsp#enable()

  "" pythonの起動設定
  let g:pyls_path = fnamemodify(g:python3_host_prog, ':h').'/'.'pyls'
  if executable(g:pyls_path) && !&diff
    let s:pyls_config = {'pyls': {'plugins': {
        \   'jedi_definition': {
        \     'enabled': v:true,
        \     'follow_imports': v:true,
        \     'follow_builtin_imports': v:true
        \   },
        \   'pycodestyle': {'enabled': v:true},
        \   'pydocstyle': {'enabled': v:false},
        \   'pylint': {'enabled': v:false},
        \   'flake8': {'enabled': v:true},
        \   'pyls_mypy': {'enabled': v:true},
        \ }}}
    autocmd User lsp_setup call lsp#register_server({
        \   'name': 'pyls',
        \   'cmd': { server_info -> [g:pyls_path] },
        \   'allowlist': ['python'],
        \   'workspace_config': s:pyls_config
        \ })
  endif
augroup END
