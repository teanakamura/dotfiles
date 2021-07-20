let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "",
        \ 'ToggleMarkAtLine'   :  "mm",
        \ 'PurgeMarksAtLine'   :  "dmm",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "m<Space>",
        \ 'PurgeMarkers'       :  "m<BS>",
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
        \ 'ListBufferMarks'    :  "m/",
        \ 'ListBufferMarkers'  :  "m?"
        \ }
if dein#check_install('vim-submode') == 0
  let g:SignatureMap['GotoNextSpotByPos'] = ""
  let g:SignatureMap['GotoPrevSpotByPos'] = ""
endif

let g:SignatureMorkTextHLDynamic = 1
nnoremap m, :<C-u>wshada!<CR>
