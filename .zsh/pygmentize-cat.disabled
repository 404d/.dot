# Source: http://felixcrux.com/blog/syntax-highlighting-cat
# Fetched on: Sat Oct 19 11:25:40 CEST 2013
function pygmentize_cat {
    for arg in "$@"; do
        pygmentize -g "${arg}" 2> /dev/null || /bin/cat "${arg}"
    done
}
command -v pygmentize > /dev/null && alias cat=pygmentize_cat
