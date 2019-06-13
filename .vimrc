" GENERAL:

" Disable vi compatibility mode
set nocompatible

" Harden the security
set secure

" Optimize terminal connection for better scrolling
set ttyfast

" Don't beep on errors
set noerrorbells

" And don't flash too
set novisualbell

" Enable filetype plugin to use specific file type settings
filetype plugin on

" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Keep 50 lines of command line history (default is 20)
set history=50



" STYLE:

" Disable the intro message
set shortmess+=I

" Enable syntax highlight
syntax on

" Preferred colors
colorscheme peachpuff

" Request support of 256 colors terminal
set t_Co=256

" Let vim set the window's title 
set title

" Show line and column numbers in the prompt
set ruler

" Show vim command you currently entering
set showcmd

" Always show status bar
set laststatus=2

" Show relative linenumbers
set relativenumber

" Set visual border for max line length
set colorcolumn=80

" Make the line length border less annoying
highlight ColorColumn ctermbg=darkgray

" Show lineendings, tabs and trailing spaces
" FIXME: find better tab sym.
" set list listchars=tab:\ \ ,trail:.
"set list listchars=tab:<-,trail:·



" FOLDING:

" Enable text folding
set foldmethod=syntax

" Unfold the code by default
set foldlevel=99



" SPELL CHEKING:

" Underline spelling errors
hi clear SpellBad
hi SpellBad cterm=underline



" TAGS:

command! MakeTags !ctags -R .



" SEARCH:

" Enable case insensitive search
set ignorecase

" Make the search case sensitive if a pattern contains an uppercase letter
set smartcase

" Highlight found symbols/words
set hlsearch

" Change bultin grep tool
set grepprg=ack



" FILE BROWSING:

" Disable annoying banner
let g:netrw_banner=0

" Open in prior window
let g:netrw_browse_split=4

" Open splits to the right
let g:netrw_altv=1

" Tree view
let g:netrw_liststyle=3

let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'



" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu



" NAVIGATION:

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



" UNDO FILES:

" Keep track of undo commands using dedicated files
set undofile

set undolevels=1000

" Where to store undo files
set undodir=~/.vim/undos/

" Create undodir if it doesn't exist
if !isdirectory(&undodir)
  echom "Creating undo directory"
  call system('mkdir -p ' . &undodir)
endif


" SNIPPETS:

nnoremap ,maincpp :-1read $HOME/.vim/skel/main.cpp<CR>6ja
nnoremap ,nodejs :-1read $HOME/.vim/skel/node.js<CR>6ja


" PLUGINS
" Bundles should be put into:
" ~/.vim/pack/bundle/start
"
" Vimball plugins installed by opening a plugin file in vim and typing:
" :so %

" [bundle] Vue syntax highlighting
" $ git clone https://github.com/posva/vim-vue.git ~/.vim/pack/bundle/start/vim-vue

" [vimball] LargeFile plugin
" https://www.vim.org/scripts/script.php?script_id=1506
"
" Minimal filesize in Mb to launch the large file plugin
" let g:LargeFile=5


" AUTOCORRECTION:

iab heigth height
iab lcocal local
iab multy multi
iab multypart multipart
iab paralells parallels
iab reecive receive
iab udpate update

