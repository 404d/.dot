if has("mouse_urxvt")
    set ttymouse=urxvt " >233 columns
elseif has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
