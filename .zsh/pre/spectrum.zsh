#! /bin/zsh
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>

typeset -Ag fx fg bg

fx=(
    reset     "[00m"
    bold      "[01m" no-bold      "[22m"
    italic    "[03m" no-italic    "[23m"
    underline "[04m" no-underline "[24m"
    blink     "[05m" no-blink     "[25m"
    reverse   "[07m" no-reverse   "[27m"
)

for color in {000..255}; do
    fg[$color]="[38;5;${color}m"
    bg[$color]="[48;5;${color}m"
done
