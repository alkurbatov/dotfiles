" Enable syntax highlight
syntax on

" Disable vi compatibility mode
set nocompatible

" Show linenumbers
set number

" Disable beep on errors
set noerrorbells
set novisualbell

" Show line and column numbers in the prompt
set ruler

" Always show status bar
set laststatus=2

" Show lineendings, tabs and trailing spaces
" FIXME: find better tab sym.
" set list listchars=tab:\ \ ,trail:.
set list listchars=tab:<-,trail:·

" Enable case insensitive search
set ignorecase

" Make the search case sensitive if a pattern contains an uppercase letter
set smartcase

" Highlight found symbols/words
set hlsearch

" Disable the into message
set shortmess+=I

" Enable text folding
set foldmethod=syntax

" Unfold the code by default
set foldlevel=99

" Disable arrow keys and mouse, we love pain
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
set mouse=

" Don't beep
set visualbell

" Enable filetype plugin to use specific file type settings
filetype plugin on

" Load templates for new files
autocmd BufNewFile node.js 0r ~/.vim/skel/node.js

" Automatically correct wrong input
iab paralells parallels
iab lcocal local
iab heigth height
iab udpate update

