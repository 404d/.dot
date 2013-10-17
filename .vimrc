set laststatus=2
set encoding=utf-8


filetype plugin indent on 
au BufNewFile,BufRead *.mako set filetype=mako

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'
""

source ~/.dot/.vim/eevee.vim

set shiftwidth=4 tabstop=4
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2
set noshowmode

let g:gundo_right = 1
nnoremap <F5> :GundoToggle<CR>

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
nmap <silent> <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
""

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

" Vim-GitGutter
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk
nmap <silent> <F10> :GitGutterToggle<CR>
let g:gitgutter_highlight_lines = 1
""

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

