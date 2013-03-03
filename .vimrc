set laststatus=2
set encoding=utf-8

filetype off
"set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

"Bundle 'gmarik/vundle'
"Bundle 'Lokaltog/vim-powerline'
set rtp+={path}/powerline/bindings/vim
filetype plugin indent on 

let g:Powerline_symbols = 'fancy'

set shiftwidth=4 tabstop=4
set shiftwidth=4 tabstop=4
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>


source ~/.dot/.vim/eevee.vim

set norelativenumber
set number

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
