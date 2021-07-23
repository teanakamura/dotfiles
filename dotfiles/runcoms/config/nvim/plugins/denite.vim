"" buffer key mappings
augroup denite_filter
  autocmd FileType denite call s:denite_my_settings()
  autocmd BufWinLeave * if &filetype == "denite" | hi CursorLine guifg=NONE | endif

  function! s:denite_my_settings() abort
    hi CursorLine guifg=#E19972
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <C-m> denite#do_map('do_action') 
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> e denite#do_map('do_action', 'edit')
    nnoremap <silent><buffer><expr> a denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> s denite#do_map('quick_move')
    nnoremap <silent><buffer><expr> H denite#do_map('move_up_path')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    nnoremap <silent><buffer>       <C-n> <Down>
    nnoremap <silent><buffer>       <C-p> <Up>
    nnoremap <silent><buffer>       <C-h> <Nop>
    nnoremap <silent><buffer>       <C-l> <Nop>
    set winblend=10
    setlocal statusline=%!denite#get_status('sources')

    if b:denite.buffer_name == 'register'
      nnoremap <silent><buffer> s :<C-u>call search(nr2char(getchar()).': .*$')<CR>
    endif
    if b:denite.buffer_name == 'jump'
      nnoremap <silent><buffer> s :<C-u>call search(' \{3}'.nr2char(getchar()).' \{2,5}\d.*$')<CR>
    inoremap     <silent><buffer>       <C-m> <Plug>(denite_filter_update)
      nnoremap <silent><buffer> S :<C-u>call search(' \{2,3}'.nr2char(getchar()).nr2char(getchar()).' \{2,5}\d.*$')<CR>
    endif
    if b:denite.buffer_name == 'mark'
      nnoremap <silent><buffer> s :<C-u>call search(' \{2}'.nr2char(getchar()).' \{2,5} \d.*$')<CR>
    endif
  endfunction

  autocmd FileType denite-filter call s:denite_filter_my_settings()
  function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer>       <ESC> <Esc><C-w><C-q>:<C-u>call denite#move_to_parent()<CR>
    inoremap <silent><buffer>       <C-s> <Esc><C-w><C-q>:<C-u>call denite#move_to_parent()<CR>
    imap     <silent><buffer>       <CR> <ESC><CR><CR>
    imap     <silent><buffer>       <C-m> <ESC><CR><CR>
    inoremap <silent><buffer>       <C-q> <Plug>(denite_filter_quit)
    inoremap <silent><buffer>       <C-l> <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    inoremap <silent><buffer>       <C-n> <ESC>
                                          \ :call denite#move_to_parent()<CR>
                                          \ :call cursor(line('.')+1, 0)<CR>
                                          \ :call denite#move_to_filter()<CR>A
    inoremap <silent><buffer>       <C-p> <ESC>
                                          \ :call denite#move_to_parent()<CR>
                                          \ :call cursor(line('.')-1, 0)<CR>
                                          \ :call denite#move_to_filter()<CR>A
    set winblend=10
  endfunction
augroup END


"" use floating window
let s:denite_default_options = {
  \   'highlight-matched-char': 'None',
  \   'highlight-matched-range': 'None',
  \   'prompt': '> ',
  \   'smartcase': v:true,
  \ }
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:denite_float_options = copy(s:denite_default_options)
call extend(s:denite_float_options, {
 \   'highlight_filter_background': 'DeniteFilter',
 \   'split': 'floating',
 \   'winwidth': float2nr(&columns * s:denite_win_width_percent),
 \   'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
 \   'winheight': float2nr(&lines * s:denite_win_height_percent),
 \   'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
 \ })
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)
call denite#custom#option('float', s:denite_float_options)
call denite#custom#option('jump', s:denite_default_options)
call denite#custom#option('register', s:denite_default_options)
call denite#custom#option('mark', s:denite_default_options)


"" Change source settings
let g:neomru#follow_links = 1
call denite#custom#option('_', 'statusline', v:true)
call denite#custom#option('_', 'converters', ['converter/abbr_word'])
call denite#custom#source('_', 'max_candidates', 100)
call denite#custom#source('_', 'matchers', ['matcher/fuzzy'])
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])


"" Add custom commnads
" command! -nargs=? Dgrep call s:Dgrep(<f-args>)
" function s:Dgrep(...)
"   if a:0 > 0
"     execute(':Denite -buffer-name=dresume_buffer grep -path='.a:1)
"   else
"     execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' grep')
"   endif
" endfunction
" command! -nargs=? Drec call s:Drec(<f-args>)
" function s:Drec(...)
"   if a:0 > 0
"     execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file/rec -path='.a:1)
"   else
"     execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file/rec')
"   endif
" endfunction
" command! -nargs=? Dfile call s:Dfile(<f-args>)
" function s:Dfile(...)
"   if a:0 > 0
"     execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file -path='.a:1)
"   else
"     execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file')
"   endif
" endfunction
" command! -nargs=? Dmru call s:denite_mru(<f-args>)
" function s:denite_mru(...)
"   if a:0 > 0
"     execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file_mru -path='.a:1)
"   else
"     execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file_mru')
"   endif
" endfunction
" command! -nargs=? DPmru call s:denite_project_mru(<f-args>)
" function s:denite_project_mru(...)
"   if a:0 > 0
"     execute(':Denite -matchers=matcher/project_files,matcher/fuzzy -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file_mru -path='.a:1)
"   else
"     execute(':Denite -matchers=matcher/project_files,matcher/fuzzy -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file_mru')
"   endif
" endfunction
" command! -nargs=? Dold call s:denite_old(<f-args>)
" function s:denite_old(...)
"   if a:0 > 0
"     execute(':Denite '.' file/old '.a:1)
"   else
"     execute(':Denite '.' file/old')
"   endif
" endfunction
" command! -nargs=? DPold call s:denite_project_old(<f-args>)
" function s:denite_project_old(...)
"   if a:0 > 0
"     execute(':Denite -matchers=matcher/project_files,matcher/fuzzy'.' file/old '.a:1)
"   else
"     execute(':Denite -matchers=matcher/project_files,matcher/fuzzy'.' file/old')
"   endif
" endfunction
command! -nargs=? Dmenu call s:denite_menu(<f-args>)
function s:denite_menu(...)
  if a:0 > 0
    execute(':Denite '.join(s:denite_option_array, ' ').' menu -buffer-name=float '.a:1)
  else
    execute(':Denite '.join(s:denite_option_array, ' ').' menu -buffer-name=float')
  endif
endfunction
command! Dm execute('Denite menu -buffer-name=float')
command! Dmv execute('Denite menu:vim -buffer-name=float')
command! Dmz execute('Denite menu:zsh -buffer-name=float')
command! Dmf execute('Denite menu:others:.fasd -buffer-name=float')
command! Dmc execute('Denite menu:my_commands -buffer-name=float')


"" Add custom menus
let s:menus = {}
let s:menus.competitive_programming = {'description': 'utils'}
let s:menus.competitive_programming.file_candidates = [
    \ ['algorithms', '~/Excercise/AtCoder/algorithms'],
    \ ['template', '~/.config/nvim/template/cpp']
  \ ]
let s:menus.zsh = {'description': 'Edit your import zsh configuration'}
let s:menus.zsh.file_candidates = [
    \ ['zshrc', '~/.zshrc'],
    \ ['zshenv', '~/.zshenv'],
    \ ['alias', '~/.config/shell/alias'],
    \ ['env', '~/.config/shell/env'],
    \ ['rc.local', '~/.config/shell/rc.local'],
    \ ['profile.local', '~/.config/shell/profile.local']
  \ ]
let s:menus.vim = {'description': 'Edit your vim configuration'}
let s:menus.vim.file_candidates = [
    \ ['init.vim', '~/.config/nvim/init.vim'],
    \ ['vimrc', '~/.config/nvim/vimrc'],
    \ ['dein.toml', '~/.config/nvim/dein/dein.toml'],
    \ ['dein_lazy.toml', '~/.config/nvim/dein/dein_lazy.toml'],
    \ ['plugins', '~/.config/nvim/plugins'],
    \ ['template', '~/.config/nvim/template'],
    \ ['cache', '~/.local/share/nvim'],
  \ ]
let s:menus.others = {'description': 'Others'}
let s:menus.others.file_candidates = [
    \ ['.fasd', '~/.fasd'],
  \ ]
let s:menus.my_commands = {'description': 'Example commands'}
let s:menus.my_commands.command_candidates = [
		\ ['Split the window', 'vnew'],
		\ ['Open zsh menu', 'Denite menu:zsh'],
		\ ['Format code', 'FormatCode', 'go,python'],
	\ ]
call denite#custom#var('menu', 'menus', s:menus)


"" Add custom keymappings
nnoremap dn :<C-u>Denite buffer -buffer-name=float<CR>
nnoremap <C-w>w :<C-u>Denite buffer -buffer-name=float<CR>
inoremap <C-w>w :<C-u>Denite buffer -buffer-name=float<CR>
nnoremap dl :<C-u>Denite file/rec -buffer-name=float<CR>
nnoremap dL :<C-u>DeniteBufferDir file/rec -buffer-name=float<CR>
nnoremap d<C-l> :<C-u>DeniteProjectDir file/rec -buffer-name=float<CR>
nnoremap do :<C-u>Denite file_mru -buffer-name=float<CR><Down>
nnoremap d<C-o> :<C-u>Denite file_mru -buffer-name=float -matchers=matcher/project_files,matcher/fuzzy<CR><Down>
nnoremap dp :<C-u>Denite -buffer-name=float<CR><Down>
nnoremap d<C-p> :<C-u>Denite -buffer-name=float -matchers=matcher/project_files,matcher/fuzzy<CR>
nnoremap dm :<C-u>Denite mark -buffer-name=mark<CR>
nnoremap M/ :<C-u>Denite mark -buffer-name=mark<CR>
nnoremap dr :<C-u>Denite register -buffer-name=register<CR>
nnoremap dj :<C-u>Denite jump -buffer-name=jump<CR>
"nnoremap dl :<C-u>Denite line/external<CR>


" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])


" " Define alias
" call denite#custom#alias('source', 'file/rec/git', 'file/rec')
" call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
" 
" call denite#custom#alias('source', 'file/rec/py', 'file/rec')
" call denite#custom#var('file/rec/py', 'command', ['scantree.py', '--path', ':directory'])


" " Change ignore_globs
" call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
"			\ [ '.git/', '.ropeproject/', '__pycache__/', 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


" " Custom action
" " Note: lambda function is not supported in Vim8.
" call denite#custom#action('file', 'test', {context -> execute('let g:foo = 1')})
" call denite#custom#action('file', 'test2',
"			\ {context -> denite#do_action(context, 'open', context['targets'])})
