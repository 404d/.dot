set laststatus=2
set encoding=utf-8

filetype off

filetype plugin indent on 

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'

set shiftwidth=4 tabstop=4
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" This doesn't work with tmux
"if system("uname") == "Darwin\n"
"    set clipboard=unnamed
"endif

source ~/.dot/.vim/eevee.vim

set norelativenumber
set number

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

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
