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


"" insert new line
call submode#enter_with('insertNewLine', 'n', '', '<Leader>n', ':<C-u>call append(line("."), "")<CR>')
call submode#enter_with('insertNewLine', 'n', '', '<Leader>N', ':<C-u>call append(line(".")-1, "")<CR>')
call submode#map('insertNewLine', 'n', '', 'n', ':<C-u>call append(line("."), "")<CR>')
call submode#map('insertNewLine', 'n', '', 'N', ':<C-u>call append(line(".")-1, "")<CR>')


"" move screen line
call submode#enter_with('moveOnScreen', 'n', '', 'gj', 'gj')
call submode#enter_with('moveOnScreen', 'n', '', 'gk', 'gk')
call submode#map('moveOnScreen', 'n', '', 'j', 'gj')
call submode#map('moveOnScreen', 'n', '', 'k', 'gk')


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


"" mark jump
call submode#enter_with('markJump', 'n', '', '[m', ':<C-u>call signature#mark#Goto("next", "spot", "pos")<CR>')
call submode#enter_with('markJump', 'n', '', '[M', ':<C-u>call signature#mark#Goto("prev", "spot", "pos")<CR>')
call submode#map('markJump', 'n', '', 'm', ':<C-u>call signature#mark#Goto("next", "spot", "pos")<CR>z.')
call submode#map('markJump', 'n', '', 'M', ':<C-u>call signature#mark#Goto("prev", "spot", "pos")<CR>z.')


"" git hunk jump
call submode#enter_with('hunkJump', 'n', '', '[h', ':<C-u>GitGutterNextHunk<CR>')
call submode#enter_with('hunkJump', 'n', '', '[H', ':<C-u>GitGutterPrevHunk<CR>')
call submode#map('hunkJump', 'n', '', 'h', ':<C-u>GitGutterNextHunk<CR>z.')
call submode#map('hunkJump', 'n', '', 'H', ':<C-u>GitGutterPrevHunk<CR>z.')
