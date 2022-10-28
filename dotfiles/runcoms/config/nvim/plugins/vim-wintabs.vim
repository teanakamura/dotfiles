map <C-h> <Plug>(wintabs_previous)
map <C-l> <Plug>(wintabs_next)
map [window]X <Plug>(wintabs_close)
map [window]u <Plug>(wintabs_undo)
map [window]o <Plug>(wintabs_only)
map [window]x <Plug>(wintabs_close_window)
map [window]z <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

autocmd VimEnter * call wintabs#all_buffers()
