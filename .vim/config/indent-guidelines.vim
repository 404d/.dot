let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
nmap <silent> <F11> :IndentGuidesToggle<CR>
autocmd vimenter * IndentGuidesEnable
