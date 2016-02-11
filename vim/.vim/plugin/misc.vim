" cleanup whitespace automatically
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call StripTrailingWhitespaces()

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable use of the mouse for all modes
set mouse=a

" make sure plugins can read filetypes
filetype indent plugin on

" set up tabs properly
set tabstop=3
set shiftwidth=3
set expandtab

" set up scrolling better
set scrolloff=7

" make commands case insensitive
set wildignorecase

" use autoindent
set autoindent

" disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
