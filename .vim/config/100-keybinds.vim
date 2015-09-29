inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

au FocusLost * :wa

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>v V`]

" Window splitting
nnoremap <leader>sh <C-w>v<C-w>h
nnoremap <leader>sj <C-w>v<C-w>j
nnoremap <leader>sl <C-w>v<C-w>l
nnoremap <leader>sl <C-w>v<C-w>l

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <S-j> 20j<CR>
nnoremap <S-k> 20k<CR>

" Loclist navigation
nnoremap ø :lp<CR>
nnoremap æ :lne<CR>

" Fuck you latex IMAP shit
nnoremap <Leader>ij <Plug>IMAP_JumpForward
