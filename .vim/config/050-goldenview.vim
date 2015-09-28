let g:goldenview__enable_default_mapping = 0
 
" 1. split to tiled windows
nnoremap <C-T>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nnoremap <F6>   <Plug>GoldenViewSwitchMain
nnoremap <S-F6> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nnoremap <C-N>  <Plug>GoldenViewNext
nnoremap <C-P>  <Plug>GoldenViewPrevious
