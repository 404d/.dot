let g:colorcolumn_width = {
            \ 'cpp': 117,
            \ 'python': 79,
            \ '*': 80,
            \}

function! Update_ColorColumn()
    let l:default = get(g:colorcolumn_width, '*', 0)
    let l:width = get(g:colorcolumn_width, &ft, l:default)
    exe 'set colorcolumn='.l:width
endfunction

au FileType * execute Update_ColorColumn()
