" Tagbar
autocmd vimenter * TagbarOpen
let g:tagbar_autoshowtag = 1
imap <silent> <F9> <C-[>:TagbarToggle<CR>
nmap <silent> <F9> :TagbarToggle<CR>

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3',
        \ 'l:Heading_L4',
        \ 'm:Heading_L5',
        \ 'n:Heading_L6'
    \ ]
    \ }
""