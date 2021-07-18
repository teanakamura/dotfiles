let g:deoplete#enable_at_startup = 1
let s:use_lsp_sources = ['lsp', 'dictionary', 'file']

inoremap <expr> <C-h> deoplete#smart_close_popup()."<C-h>"
inoremap <expr> <BS> deoplete#smart_close_popup()."<C-h>"

call deoplete#custom#option({
  \ 'auto_complete': v:true,
  \ 'min_pattern_length': 2,
  \ 'auto_complete_delay': 0,
  \ 'auto_refresh_delay': 20,
  \ 'refresh_always': v:true,
  \ 'smart_case': v:true,
  \ 'camel_case': v:true,
  \ })
call deoplete#custom#option('sources', {
  \ 'python': s:use_lsp_sources,
  \ 'vim': ['vim', 'buffer', 'dictionary', 'file'],
  \})
