let g:goldenview__enable_default_mapping = 0
 
" 1. split to tiled windows
nmap <C-T>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <F6>   <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <C-N>  <Plug>GoldenViewNext
nmap <C-P>  <Plug>GoldenViewPrevious
