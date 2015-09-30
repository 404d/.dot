let g:goldenview__enable_default_mapping = 0
nmap <F6>  <Plug>ToggleGoldenViewAutoResize
 
" 1. split to tiled windows
nmap <C-T>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap \| <Plug>GoldenViewSwitchToggle
nmap <Leader>m   <Plug>GoldenViewSwitchMain

" 3. jump to next and previous window
nmap <C-N>  <Plug>GoldenViewNext
nmap <C-P>  <Plug>GoldenViewPrevious
