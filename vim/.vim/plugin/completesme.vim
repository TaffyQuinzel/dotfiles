let b:vcm_tab_complete = "vim"

" let enter insert the value
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" select first instead of last
let g:vcm_direction = 'p'
