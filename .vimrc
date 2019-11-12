" GENERAL:

" Disable vi compatibility mode
set nocompatible

" Harden the security
set secure

" Optimize terminal connection for better scrolling
set ttyfast

" Don't beep on errors
set noerrorbells

" And don't flash, too
set visualbell
set vb t_vb=

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

" Request support of 256 colors terminal
" Uncomment this if vim doesn't recognise 256 colormode of a terminal 
"set t_Co=16

" Preferred colors
" Uncomment this when proper colorscheme is installed
"colorscheme solarized

" Let vim set the window's title 
set title

" Show line and column numbers in the prompt
set ruler

" Show vim command you currently entering
set showcmd

" Always show status bar
set laststatus=2

" Customise status bar
" Many thanks to
" https://shapeshed.com/vim-statuslines/
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%#CursorColumn#
set statusline+=\ %l:%c
set statusline+=\ (%p%%)
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ 

" Show relative linenumbers
set relativenumber

" Set visual border for max line length
set colorcolumn=80

" Make the line length border less annoying
highlight ColorColumn ctermbg=gray

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



" EDITING:

" F5: Remove trailing whitespaces
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>



" PLUGINS:

" Bundles should be put into:
" ~/.vim/pack/bundle/start
"
" Vimball plugins installed by opening a plugin file in vim and typing:
" :so %

" [vimfile] Solorized colorscheme
" $ git clone https://github.com/altercation/vim-colors-solarized.git
" $ mv vim-colors-solarized/colors ~/.vim
" $ rm -rf vim-colors-solarized
"
" To fix OS X terminal colorscheme import these settings
" https://github.com/tomislav/osx-terminal.app-colors-solarized

" [bundle] Vue syntax highlighting
" $ git clone https://github.com/posva/vim-vue.git ~/.vim/pack/plugins/start/vim-vue

" [bundle] A tree explorer plugin for vim
" $ git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/plugins/start/nerdtree

" [bundle] A Git wrapper
" $ git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/vim-fugitive

" [bundle] Syntax checking hacks for vim
" $ git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/pack/plugins/start/syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" [bundle] Show a diff using Vim its sign column
" $ git clone https://github.com/mhinz/vim-signify.git ~/.vim/pack/plugins/start/vim-signify
"
" List of allowed VCS
" let g:signify_vcs_list = ['git']

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



" HELPERS:

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
