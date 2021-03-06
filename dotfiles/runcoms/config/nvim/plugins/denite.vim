"" buffer key mappings

augroup denite_filter
  autocmd FileType denite call s:denite_my_settings()
  autocmd BufWinLeave * if &filetype == "denite" | hi CursorLine guifg=NONE | endif
  function! s:denite_my_settings() abort
    hi CursorLine guifg=#E19972
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <C-m> denite#do_map('do_action') 
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> c denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> <BS> denite#do_map('move_up_path')
    nnoremap <silent><buffer><expr> D denite#do_map('quick_move')
    nnoremap <silent><buffer><expr> H denite#do_map('move_up_path')
    nnoremap <silent><buffer>       <C-n> <Down>
    nnoremap <silent><buffer>       <C-p> <Up>
    set winblend=10
  endfunction

  autocmd FileType denite-filter call s:denite_filter_my_settings()
  function! s:denite_filter_my_settings() abort
    imap     <silent><buffer>       <C-q> <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    nmap     <silent><buffer>       <C-m> <Plug>(denite_filter_update)
    nmap     <silent><buffer>       j <Plug>(denite_filter_update)<Down>
    nmap     <silent><buffer>       k <Plug>(denite_filter_update)<Up>
    imap     <silent><buffer>       <C-m> <Plug>(denite_filter_update)
    imap     <silent><buffer>       <C-n> <Plug>(denite_filter_update)<Down>
    imap     <silent><buffer>       <C-p> <Plug>(denite_filter_update)<Up>
    nnoremap <silent><buffer><expr> <BS> denite#do_map('move_up_path')
    nnoremap <silent><buffer><expr> <C-h> denite#do_map('move_up_path')
    set winblend=10
  endfunction
augroup END


"" use floating window
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
   \   'split': 'floating',
   \   'winwidth': float2nr(&columns * s:denite_win_width_percent),
   \   'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
   \   'winheight': float2nr(&lines * s:denite_win_height_percent),
   \   'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
   \   'highlight_filter_background': 'DeniteFilter',
   \   'prompt': '$ ',
   \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)


"" Change source settings
let g:neomru#follow_links = 1
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file/rec', 'matchers', ['matcher/cpsm'])
call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])
call denite#custom#source('file_mru', 'matchers', ['matcher/fuzzy'])
"call denite#custom#kind('file', 'default_action', 'split')
call denite#custom#source('file/old', 'matchers', ['matcher/fuzzy'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])


"" Add custom commnads
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=dresume_buffer grep -path='.a:1)
  else
    execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' grep')
  endif
endfunction
command! -nargs=? Drec call s:Drec(<f-args>)
function s:Drec(...)
  if a:0 > 0
    execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file/rec -path='.a:1)
  else
    execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file/rec')
  endif
endfunction
command! -nargs=? Dfile call s:Dfile(<f-args>)
function s:Dfile(...)
  if a:0 > 0
    execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file -path='.a:1)
  else
    execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file')
  endif
endfunction
command! -nargs=? Dmru call s:denite_mru(<f-args>)
function s:denite_mru(...)
  if a:0 > 0
    execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file_mru -path='.a:1)
  else
    execute(':Denite -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file_mru')
  endif
endfunction
command! -nargs=? DPmru call s:denite_project_mru(<f-args>)
function s:denite_project_mru(...)
  if a:0 > 0
    execute(':Denite -matchers=matcher/project_files,matcher/fuzzy -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file_mru -path='.a:1)
  else
    execute(':Denite -matchers=matcher/project_files,matcher/fuzzy -buffer-name=dresume_buffer '.join(s:denite_option_array, ' ').' file_mru')
  endif
endfunction
command! -nargs=? Dold call s:denite_old(<f-args>)
function s:denite_old(...)
  if a:0 > 0
    execute(':Denite '.' file/old '.a:1)
  else
    execute(':Denite '.' file/old')
  endif
endfunction
command! -nargs=? DPold call s:denite_project_old(<f-args>)
function s:denite_project_old(...)
  if a:0 > 0
    execute(':Denite -matchers=matcher/project_files,matcher/fuzzy'.' file/old '.a:1)
  else
    execute(':Denite -matchers=matcher/project_files,matcher/fuzzy'.' file/old')
  endif
endfunction
command! -nargs=? Dmenu call s:denite_menu(<f-args>)
function s:denite_menu(...)
  if a:0 > 0
    execute(':Denite '.join(s:denite_option_array, ' ').' menu '.a:1)
  else
    execute(':Denite '.join(s:denite_option_array, ' ').' menu')
  endif
endfunction


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
let s:menus.my_commands = {'description': 'Example commands'}
let s:menus.my_commands.command_candidates = [
		\ ['Split the window', 'vnew'],
		\ ['Open zsh menu', 'Denite menu:zsh'],
		\ ['Format code', 'FormatCode', 'go,python'],
	\ ]
call denite#custom#var('menu', 'menus', s:menus)


"" Add custom keymappings
nnoremap dn :<C-u>Denite buffer<CR>
tnoremap dn :<C-u>Denite buffer<CR>
nnoremap <C-w>w :<C-u>Denite buffer<CR>
inoremap <C-w>w :<C-u>Denite buffer<CR>
tnoremap <C-w>w :<C-u>Denite buffer<CR>
nnoremap dr :<C-u>Denite file/rec<CR>
tnoremap dr :<C-u>Denite file/rec<CR>
nnoremap dl :<C-u>Denite line/external<CR>
tnoremap dl :<C-u>Denite line/external<CR>
nnoremap do :<C-u>Denite file_mru<CR><Down>
tnoremap do :<C-u>Denite file_mru<CR><Down>
nnoremap dO :<C-u>Denite file/old<CR><Down>
tnoremap dO :<C-u>Denite file/old<CR><Down>
nnoremap dp :<C-u>DPmru<CR><Down>
tnoremap dp :<C-u>DPmru<CR><Down>
nnoremap dP :<C-u>DPold<CR>
tnoremap dP :<C-u>DPold<CR>


" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command', ['scantree.py', '--path', ':directory'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
			\ [ '.git/', '.ropeproject/', '__pycache__/', 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Custom action
" Note: lambda function is not supported in Vim8.
call denite#custom#action('file', 'test', {context -> execute('let g:foo = 1')})
call denite#custom#action('file', 'test2',
			\ {context -> denite#do_action(context, 'open', context['targets'])})
