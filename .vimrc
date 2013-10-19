set encoding=utf-8
set backupdir=~/.vim/tmp/,/tmp,/var/tmp,$HOME/Local\ Settings/Temp
set directory=~/.vim/tmp/,/tmp,/var/tmp,$HOME/Local\ Settings/Temp

for sourcefile in split(globpath(expand('~/.vim/config/pre'), '*.vim'), '\n')
    if filereadable(sourcefile)
        exe 'source' sourcefile
    else
        echo "Warning: " sourcefile " is unreadable"
    endif
endfor

filetype plugin indent on

for sourcefile in split(globpath(expand('~/.vim/config'), '*.vim'), '\n')
    if filereadable(sourcefile)
        exe 'source' sourcefile
    else
        echo "Warning: " sourcefile " is unreadable"
    endif
endfor

au BufNewFile,BufRead *.mako set filetype=mako

set shiftwidth=4 tabstop=4
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

set laststatus=2
set noshowmode

for sourcefile in split(globpath(expand('~/.vim/config/post'), '*.vim'), '\n')
    if filereadable(sourcefile)
        exe 'source' sourcefile
    else
        echo "Warning: " sourcefile " is unreadable"
    endif
endfor

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

