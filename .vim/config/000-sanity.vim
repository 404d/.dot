" Surpresses mode change messages and some weird completion messages.
set noshowmode
set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/

if !isdirectory(expand("~/.vim/tmp"))
    let a = mkdir(expand('~/.vim/tmp'))
endif
if !isdirectory(expand("~/.vim/undo"))
    let a = mkdir(expand('~/.vim/undo'))
endif
