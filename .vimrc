set laststatus=2
set encoding=utf-8

filetype off

filetype plugin indent on 

let g:Powerline_symbols = 'fancy'

set shiftwidth=4 tabstop=4
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

if system("uname") == "Darwin\n"
    set clipboard=unnamed
endif

source ~/.dot/.vim/eevee.vim

set norelativenumber
set number

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
