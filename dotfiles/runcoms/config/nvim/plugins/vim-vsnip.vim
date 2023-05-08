let g:vsnip_snippet_dir = '~/.config/nvim/snippet'
imap <expr> <C-j> vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"
