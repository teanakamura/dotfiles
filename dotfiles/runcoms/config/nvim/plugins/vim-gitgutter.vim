set signcolumn=yes
set updatetime=1000

nmap [c <Nop>
if dein#check_install('vim-submode') != 0
  nmap [h <Plug>(GitGutterNextHunk)
  nmap [H <Plug>(GitGutterPrevHunk)
endif

nmap <Leader>gs <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>gp <Plug>(GitGutterPreviewHunk)

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)
