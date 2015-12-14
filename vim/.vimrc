" pathogen settings stuff
execute pathogen#infect()
syntax on
filetype plugin indent on

let g:airline_powerline_fonts = 1
" syntax highlighting
filetype plugin on
filetype indent on
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.aux,*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" powerline stuff
set noshowmode
set laststatus=2
set showtabline=2

" color theme
set nocompatible                                           
set t_Co=256                                                
" call pathogen#infect()                                     
set background=dark " dark | light "                       
colorscheme neverland
"hi Normal ctermbg=NONE

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use no spaces instead of tabs
set noexpandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 3 spaces
set shiftwidth=3
set tabstop=3

" Linebreak on 500 characters
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Always display the status line, even if only one window is displayed
set laststatus=2

" Enable use of the mouse for all modes
set mouse=a

" enable line numbers & bar
set relativenumber
set number
set cursorline

" cursor settings
if &term =~ "xterm\\|rxvt"
   " use an red cursor in insert mode
   let &t_SI = "\<Esc>]12;#dc322f\x7"
   " use a grey cursor otherwise
   let &t_EI = "\<Esc>]12;#93a1a1\x7"
endif

" paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" autosave functionality 
" when focus is lost
":au FocusLost * :wa
" autosave plugin
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
"let g:auto_save_events = ["InsertLeave", "TextChanged"]

" autocomplete functionality
"set omnifunc=syntaxcomplete#Complete
let g:neocomplete#enable_at_startup = 1
