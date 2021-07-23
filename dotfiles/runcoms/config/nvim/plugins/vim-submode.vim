let g:submode_always_show_submode = 1
let g:submode_timeout = 1
let g:submode_timeoutlen = 3000
let g:submode_keep_leaving_key = 1


"" notice: not map but noremap

"" window size
call submode#enter_with('winsize', 'n', '', '<C-w>L', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w>H', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>K', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>J', '<C-w>-')
call submode#map('winsize', 'n', '', 'L', '<C-w>>')
call submode#map('winsize', 'n', '', 'H', '<C-w><')
call submode#map('winsize', 'n', '', 'K', '<C-w>+')
call submode#map('winsize', 'n', '', 'J', '<C-w>-')


"" indent
call submode#enter_with('indent', 'n', '', '>>', '>>')
call submode#enter_with('indent', 'n', '', '<<', '<<')
call submode#map('indent', 'n', '', '>', '>>')
call submode#map('indent', 'n', '', '<', '<<')
call submode#enter_with('i_indent', 'i', '', '<C-o>>', '<C-o>>>')
call submode#enter_with('i_indent', 'i', '', '<C-o><', '<C-o><<')
call submode#enter_with('i_indent', 'i', '', '<C-g>>', '<C-o>>>')
call submode#enter_with('i_indent', 'i', '', '<C-g><', '<C-o><<')
call submode#map('i_indent', 'i', '', '>', '<C-o>>>')
call submode#map('i_indent', 'i', '', '<', '<C-o><<')


"" insert new line
call submode#enter_with('insertNewLine', 'n', '', '<Leader>n', ':<C-u>call append(line("."), "")<CR>')
call submode#enter_with('insertNewLine', 'n', '', '<Leader>N', ':<C-u>call append(line(".")-1, "")<CR>')
call submode#map('insertNewLine', 'n', '', 'n', ':<C-u>call append(line("."), "")<CR>')
call submode#map('insertNewLine', 'n', '', 'N', ':<C-u>call append(line(".")-1, "")<CR>')


"" move screen line
call submode#enter_with('moveOnScreen', 'nv', '', 'gj', 'gj')
call submode#enter_with('moveOnScreen', 'nv', '', 'gk', 'gk')
call submode#map('moveOnScreen', 'nv', '', 'j', 'gj')
call submode#map('moveOnScreen', 'nv', '', 'k', 'gk')


"" screen up/down
call submode#enter_with('screenUpDown', 'nv', '', 'g<C-j>', '<C-e>j')
call submode#enter_with('screenUpDown', 'nv', '', 'g<C-k>', '<C-y>k')
call submode#map('screenUpDown', 'nv', '', '<C-j>', '<C-e>j')
call submode#map('screenUpDown', 'nv', '', '<C-k>', '<C-y>k')


"" delete word
call submode#enter_with('delWord', 'n', '', '<C-w><C-w>', '"_dvb')
call submode#enter_with('delWord', 'n', '', 'db', '"_dvb')
call submode#enter_with('delWord', 'n', '', 'dB', '"_dvb')
call submode#enter_with('delWord', 'n', '', 'de', '"_dve')
call submode#enter_with('delWord', 'n', '', 'dE', '"_dvE')
call submode#map('delWord', 'n', '', '<C-w>', '"_dvb')
call submode#map('delWord', 'n', '', 'b', '"_dvb')
call submode#map('delWord', 'n', '', 'B', '"_dvB')
call submode#map('delWord', 'n', '', 'e', '"_dve')
call submode#map('delWord', 'n', '', 'E', '"_dvE')


"" section jump
call submode#enter_with('sectionJump', 'n', '', '[[', '[[')
call submode#enter_with('sectionJump', 'n', '', ']]', ']]')
call submode#map('sectionJump', 'n', '', '[', '[[z.')
call submode#map('sectionJump', 'n', '', ']', ']]z.')


"" mark jump (require vim-signature)
call submode#enter_with('markJump', 'n', '', '[m', ':<C-u>call signature#mark#Goto("next", "spot", "pos")<CR>')
call submode#enter_with('markJump', 'n', '', '[M', ':<C-u>call signature#mark#Goto("prev", "spot", "pos")<CR>')
call submode#map('markJump', 'n', '', 'm', ':<C-u>call signature#mark#Goto("next", "spot", "pos")<CR>z.')
call submode#map('markJump', 'n', '', 'M', ':<C-u>call signature#mark#Goto("prev", "spot", "pos")<CR>z.')


"" git hunk jump (require vim-gitgutter)
call submode#enter_with('hunkJump', 'n', '', '[h', ':<C-u>GitGutterNextHunk<CR>')
call submode#enter_with('hunkJump', 'n', '', '[H', ':<C-u>GitGutterPrevHunk<CR>')
call submode#map('hunkJump', 'n', '', 'h', ':<C-u>GitGutterNextHunk<CR>z.')
call submode#map('hunkJump', 'n', '', 'H', ':<C-u>GitGutterPrevHunk<CR>z.')


"" insert mode scroll
call submode#enter_with('i_scroll', 'i', '', '<C-o><C-j>', '<C-o><C-y>')
call submode#enter_with('i_scroll', 'i', '', '<C-o><C-k>', '<C-o><C-e>')
call submode#enter_with('i_scroll', 'i', '', '<C-g><C-j>', '<C-o><C-y>')
call submode#enter_with('i_scroll', 'i', '', '<C-g><C-k>', '<C-o><C-e>')
call submode#map('i_scroll', 'i', '', '<C-j>', '<C-o><C-y>')
call submode#map('i_scroll', 'i', '', '<C-k>', '<C-o><C-e>')


"" insret mode move
call submode#enter_with('i_move', 'i', '', '<C-o>j', '<C-o>j')
call submode#enter_with('i_move', 'i', '', '<C-o>k', '<C-o>k')
call submode#enter_with('i_move', 'i', '', '<C-g>j', '<C-o>j')
call submode#enter_with('i_move', 'i', '', '<C-g>k', '<C-o>k')
call submode#map('i_move', 'i', '', 'j', '<C-o>j')
call submode#map('i_move', 'i', '', 'k', '<C-o>k')


"" insert mode repeat f search (require vim-easymotion)
call submode#enter_with('i_fsearch', 'i', '', '<C-]>', '<C-o>:<C-u>call Jump_like_as_prev_jump(1)<CR>')
call submode#map('i_fsearch', 'i', '', '<C-]>', '<C-o>:<C-u>call Jump_like_as_prev_jump(1)<CR>')
call submode#map('i_fsearch', 'i', '', '<C-[>', '<C-o>:<C-u>call Jump_like_as_prev_jump(0)<CR>')
