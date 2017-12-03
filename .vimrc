syntax enable
set background=light
colorscheme solarized

set number " Show line numbers
syntax on  " Enable syntax highlighting

set showcmd      " Show (partial) command in status line.
set showmatch    " Show matching brackets.
set ignorecase   " Do case insensitive matching
set smartcase    " Do smart case matching
set hlsearch     " Highlight everything that matches
set incsearch    " Incremental search
set autowrite    " Automatically save before commands like :next and :make
set hidden       " Hide buffers when they are abandoned
set mouse=a      " Enable mouse usage (all modes)

set tabstop=4
set softtabstop=4
set shiftwidth=4

"set et  " For Python files mostly

set formatoptions=tcro
set wrap
set linebreak
set list                " Show line endings

set guifont=inconsolata\ 12

abbreviate #i #include
abbreviate #d #define
abbreviate #f #ifdef
abbreviate #e #endif

iab paralells parallels
iab lcocal local
iab heigth height
iab udpate update

" Plugin specific
let g:LargeFile=5

