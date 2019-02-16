" Enable syntax highlight
syntax on

" Disable vi compatibility mode
set nocompatible

" Harden the security
set secure

" Optimize terminal connection for better scrolling
set ttyfast

" Preferred colors
colorscheme peachpuff

" Underline spelling errors
hi clear SpellBad
hi SpellBad cterm=underline

" Request support of 256 colors terminal
set t_Co=256

" Show relative linenumbers
set relativenumber

" Don't beep on errors
set noerrorbells

" And don't flash too
set novisualbell

" Let vim set the window's title 
set title

" Show line and column numbers in the prompt
set ruler

" Show vim command you currently entering
set showcmd

" Always show status bar
set laststatus=2

" Set visual border for max line length
set colorcolumn=80

" Make the line length border less annoying
highlight ColorColumn ctermbg=darkgray

" Keep 50 lines of command line history (default is 20)
set history=50

" Show lineendings, tabs and trailing spaces
" FIXME: find better tab sym.
" set list listchars=tab:\ \ ,trail:.
"set list listchars=tab:<-,trail:·

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

" Change bultin grep tool
set grepprg=ack

" Enable filetype plugin to use specific file type settings
filetype plugin on

" Load templates for new files
autocmd BufNewFile node.js 0r ~/.vim/skel/node.js

" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Enable undo files
set undofile
set undolevels=1000
set undodir=~/.vim/undos/
if !isdirectory(&undodir)
  echom "Creating undo directory"
  call system('mkdir ' . &undodir)
endif

" Automatically correct wrong input
iab heigth height
iab lcocal local
iab multy multi
iab multypart multipart
iab paralells parallels
iab reecive receive
iab udpate update

