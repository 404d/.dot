if has("gui_running")
    if has("gui_macvim")
        set guifont=Inconsolata\ for\ Powerline:h10
        set transparency=10
    else
        set guifont=Inconsolata\ for\ Powerline\ 11
    endif

    set guioptions+=LlRrbT
    set guioptions-=LlRrbT

    set mousehide
endif
