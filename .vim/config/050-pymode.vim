""
"   Copyright (c) 2014, Alex Munroe
"   https://raw.github.com/eevee/rc/d4a39198059bd5cb909acb3f5e28ff6eeacd257e/.vimrc
"
""
" Python-mode; disable linting, use syntastic
let g:pymode_lint = 0
" Aaand the rope stuff conflicts with jedi, surprise
let g:pymode_rope = 0
" Rope is fucking idiotic and keeps recursively reading my entire home
" directory.  This at least tells it not to search upwards looking for a
" .ropeproject marker.
let g:pymode_rope_lookup_project = 0
" This is pretty fucking annoying too
let g:pymode_rope_complete_on_dot = 0
