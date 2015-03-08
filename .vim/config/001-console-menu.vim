" if !has("gui_running")
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F2> :emenu <C-Z>
" endif
