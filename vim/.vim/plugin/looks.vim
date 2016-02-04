" set colors to 16 so vim uses Xresource colours
set t_Co=16

" Height of the command bar
set cmdheight=2

" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.aux,*.o,*~,*.pyc

" Always show current position
set ruler

" enable line numbers & bar
set number
set cursorline

" cursor settings
if &term =~ "xterm\\|rxvt"
   " use an red cursor in insert mode
   let &t_SI = "\<Esc>]12;#dc322f\x7"
   " use a grey cursor otherwise
   let &t_EI = "\<Esc>]12;#93a1a1\x7"
endif
