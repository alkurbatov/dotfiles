" GENERAL:

" Show linenumbers.
set number

" Allow to load local (per project) config files.
set exrc

" Disallows the use of :autocmd, shell and write commands in local config files.
set secure

" Show several lines after the last one.
set scrolloff=1

" Scroll horizontaly on long lines.
set sidescrolloff=5

" Delete comment character when joining commented lines
set formatoptions+=j



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



" STYLE:

" Enable nice colors in terminal.
set termguicolors

" Special markup for tabs, spaces and other chars when 'set list' is on.
set listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:+

" Let vim set the window's title 
set title

" Make the line length border less annoying.
highlight ColorColumn ctermbg=gray

" Customise status bar,
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

" Always show statusline.
set laststatus=2



" SEARCH:

" Enable case insensitive search.
set ignorecase

" Make the search case sensitive if a pattern contains an uppercase letter.
set smartcase



" SWAP FILES:

" Protect changes between writes.
" Default values:
" updatecount (200 keystrokes);
" updatetime (4 seconds).
set swapfile

" Where to store swap files.
set directory=~/.local/share/nvim/swap//

" Create swap directory if it doesn't exist.
if !isdirectory(&directory)
  echom "Creating swap directory"
  call system('mkdir -p ' . &directory)
endif

" How often update swap file (ms).
" Also, used by vim-fugitive as update interval.
set updatetime=100



" BACKUPS:

" Protect against crash-during-write.
set writebackup

" FIXME: (alkurbatov): Set nowritebackup if file size is too big.

" But do not persist backup after successful write.
set nobackup

" Use rename-and-write-new method whenever safe.
set backupcopy=auto

" Where to store backups.
set backupdir=~/.local/share/nvim/backup//

" FIXME: (alkurbatov): Restrict access to the tmp files as it can contain
" sensible data.

" Create backup if it doesn't exist.
if !isdirectory(&backupdir)
  echom "Creating backup directory"
  call system('mkdir -p ' . &backupdir)
endif



" UNDO AND HISTORY:

" Increase cmdline history size.
set history=1000

" Keep track of undo commands using dedicated files.
set undofile

set undolevels=1000

" Where to store undo files.
set undodir=~/.local/share/nvim/undos//

" Create undodir if it doesn't exist.
if !isdirectory(&undodir)
  echom "Creating undo directory"
  call system('mkdir -p ' . &undodir)
endif



" SESSIONS:

" Specify special folder to store sessions.
let g:sessionsdir=expand('~/.local/share/nvim/sessions')

" Create session folder if it doesn't exist.
if !isdirectory(g:sessionsdir)
  echom "Creating session directory"
  call system('mkdir -p ' . g:sessionsdir)
endif

exec 'nnoremap <Leader>ss :mks! ' . g:sessionsdir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessionsdir. '/*.vim<C-D><BS><BS><BS><BS><BS>'



" TERMINAL MODE:

" Launch the builtin terminal in insert mode.
autocmd TermOpen term://* startinsert

"Exit from insert mode of the builtin terminal by pressing Esc.
tnoremap <Esc> <C-\><C-n>



" KEYBOARD SHORTCUTS:

" Mac: Alt+j: Move current line down.
nnoremap ∆ :m .+1<CR>==
inoremap ∆ <ESC>:m .+1<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv

" Mac: Alt+k: Move the current line up.
nnoremap ˚ :m .-2<CR>==
inoremap ˚ <ESC>:m .-2<CR>==gi
vnoremap ˚ :m '<-2<CR>gv=gv

" F5: Remove trailing whitespaces.
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Toggle the paste mode to make it possible to paste text from other application without changing it.
nnoremap \o :set paste!<CR>

" Togle display of linenumbers.
nnoremap \l :setlocal number!<CR>

" Clear highlighting of search results.
nnoremap \q :nohlsearch<CR>

" Go to another file by searching it via fzf (in the current project).
nnoremap <C-P> :Files! .<CR>

" Go to another file by searching it via fzf (in the home folder).
nnoremap <C-M-P> :Files! ~/work<CR>

" Open NERD tree.
nnoremap \e :NERDTreeToggle<CR>



" HANDY COMMANDS

" Save file as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Create C/C++ tags file.
command! MakeTags !ctags -R .



" RU LANGUAGE SUPPORT:
nnoremap о j
nnoremap л k
nnoremap р h
nnoremap д l
nnoremap ш i



" JP LANGUAGE SUPPORT:

nnoremap い i



" FILETYPES

" Identify nginx configs.
au BufRead,BufNewFile /etc/nginx/*,*/nginx/conf.d/*,/usr/local/nginx/conf/*,*/conf/nginx.conf if &ft == '' | setfiletype nginx | endif



" AUTOCORRECTION:

iab Implemnet Implement
iab Towh Town
iab heigth height
iab implemnet implement
iab lcocal local
iab multy multi
iab multypart multipart
iab paralells parallels
iab reecive receive
iab towh town
iab udpate update



" SNIPPETS:

nnoremap ,maincpp :-1read $HOME/.config/nvim/skel/main.cpp<CR>6ja
nnoremap ,nodejs :-1read $HOME/.config/nvim/skel/node.js<CR>6ja



" PLUGINS:

" Extra colorschemes.
" $ git clone https://github.com/flazz/vim-colorschemes.git ~/.local/share/nvim/site/pack/core/start/vim-colorschemes
colorscheme solarized8_dark_flat

" ALE syntax checker:
" $ git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/linting/opt/ale

" Set up custom error and warning signs.
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'

" Keep the sign gutter open at all time.
let g:ale_sign_column_always = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Syntax highlight for Vue.js.
" $ git clone https://github.com/leafOfTree/vim-vue-plugin.git ~/.local/share/nvim/site/pack/js/opt/vim-vue-plugin

" Syntax highlight for Ansible.
" $ git clone https://github.com/pearofducks/ansible-vim.git ~/.local/share/nvim/site/pack/ansible/opt/ansible-vim

" Git gutter.
" $ git clone https://github.com/airblade/vim-gitgutter.git ~/.local/share/nvim/site/pack/git/start/vim-gitgutter

" Set better marks
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'

" Extended git integration.
" $ git clone https://github.com/tpope/vim-fugitive.git ~/.local/share/nvim/site/pack/git/start/vim-fugitive

" Git messenger.
" $ git clone https://github.com/rhysd/git-messenger.vim.git ~/.local/share/nvim/site/pack/git/start/git-messenger

" Python syntax highlight.
" $ git clone https://github.com/vim-python/python-syntax.git ~/.local/share/nvim/site/pack/python/opt/python-syntax

" Nginx plugin.
" $ git clone https://github.com/chr4/nginx.vim.git ~/.local/share/nvim/site/pack/web/opt/nginx.vim

" Fuzzy finder.
" $ git clone https://github.com/junegunn/fzf.git ~/.local/share/nvim/site/pack/core/start/fzf
" $ git clone https://github.com/junegunn/fzf.vim.git ~/.local/share/nvim/site/pack/core/start/fzf.vim

" File manager.
" $ git clone https://github.com/preservim/nerdtree.git ~/.local/share/nvim/site/pack/core/start/nerdtree

" Simplify comment out code.
" $ git clone https://tpope.io/vim/commentary.git ~/.local/share/nvim/site/pack/core/start/commentary

" Better Javascript suppport.
" $ git clone https://github.com/pangloss/vim-javascript.git ~/.local/share/nvim/site/pack/js/opt/vim-javascript



" HELPERS:

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
