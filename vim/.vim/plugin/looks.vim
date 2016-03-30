" set colors to 16 so vim uses Xresource colours
set t_Co=16
" let base16colorspace=256  " Access colors present in 256 colorspace
" set background=dark
" colorscheme soleo

" Height of the command bar
set cmdheight=2

" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.aux,*.o,*~,*.pyc

" Always show current position
set ruler

" enable line numbers
set number

" enable cursor bar & column highlighter
set cursorcolumn
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=darkgrey

" cursor settings
if &term =~ "xterm\\|rxvt"
   " use an red cursor in insert mode
   let &t_SI = "\<Esc>]12;#dc322f\x7"
   " use a grey cursor otherwise
   let &t_EI = "\<Esc>]12;#93a1a1\x7"
endif
