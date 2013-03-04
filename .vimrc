set laststatus=2
set encoding=utf-8

filetype off

filetype plugin indent on 

let g:Powerline_symbols = 'fancy'

set shiftwidth=4 tabstop=4
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>


source ~/.dot/.vim/eevee.vim

set norelativenumber
set number

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
