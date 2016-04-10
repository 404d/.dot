" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
nmap <silent> <F8> :NERDTreeToggle<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pdf$', '\.aux$', '\.synctex.gz$', '\.out$']
""
