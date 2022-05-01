let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "",
        \ 'ToggleMarkAtLine'   :  "M",
        \ 'PurgeMarksAtLine'   :  "",
        \ 'DeleteMark'         :  "",
        \ 'PurgeMarks'         :  "",
        \ 'PurgeMarkers'       :  "",
        \ 'GotoNextLineAlpha'  :  "",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "]s",
        \ 'GotoPrevSpotAlpha'  :  "[s",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "]S",
        \ 'GotoPrevSpotByPos'  :  "[S",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListBufferMarks'    :  "",
        \ 'ListBufferMarkers'  :  ""
        \ }
if dein#check_install('vim-submode') == 0
  let g:SignatureMap['GotoNextSpotByPos'] = ""
  let g:SignatureMap['GotoPrevSpotByPos'] = ""
endif

let g:SignatureMorkTextHLDynamic = 1
" nnoremap M, :<C-u>wshada!<CR>

nnoremap dM :<C-u>call signature#mark#Purge("all")<CR>:<C-u>wshada!<CR>,
