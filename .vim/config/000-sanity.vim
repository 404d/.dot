" Surpresses mode change messages and some weird completion messages.
set noshowmode
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/undo//

if !isdirectory(expand("~/.vim/tmp"))
    let a = mkdir(expand('~/.vim/tmp'))
endif
if !isdirectory(expand("~/.vim/undo"))
    let a = mkdir(expand('~/.vim/undo'))
endif

" Make vim more responsive by sacrificing swap files
" and decreasing updatetime
set noswapfile updatetime=200
set conceallevel=0
