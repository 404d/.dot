" Powerline
if !has("nvim")
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
    let g:Powerline_symbols = 'fancy'
endif
""
