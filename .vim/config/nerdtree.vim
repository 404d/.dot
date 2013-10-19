" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
nmap <silent> <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
""
