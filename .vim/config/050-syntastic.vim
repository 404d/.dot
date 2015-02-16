let g:syntastic_auto_loc_list = 1 " Enable automatic location list population
let g:syntastic_aggregate_errors = 1 " Needed when using multiple checkers for a file
let g:syntastic_check_on_open = 1

let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"

let g:syntastic_python_checkers=['flake8', 'py3kwarn', 'python', 'mypy']
let g:syntastic_python_flake8_args = "--max-complexity 12 --ignore=E701"
