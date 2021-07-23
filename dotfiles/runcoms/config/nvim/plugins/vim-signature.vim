let g:SignatureMap = {
        \ 'Leader'             :  "d@",
        \ 'PlaceNextMark'      :  "",
        \ 'ToggleMarkAtLine'   :  "M",
        \ 'PurgeMarksAtLine'   :  "",
        \ 'DeleteMark'         :  "",
        \ 'PurgeMarks'         :  "",
        \ 'PurgeMarkers'       :  "",
        \ 'GotoNextLineAlpha'  :  "",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "]m",
        \ 'GotoPrevSpotAlpha'  :  "]M",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "[m",
        \ 'GotoPrevSpotByPos'  :  "[M",
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
nnoremap M, :<C-u>wshada!<CR>

nnoremap dM :<C-u>call signature#mark#Purge("all")<CR>:<C-u>wshada!<CR>,
