" GENERAL:

" Show linenumbers.
set number

" Allow to load local (per project) config files.
set exrc

" Disallows the use of :autocmd, shell and write commands in local config files.
set secure



" STYLE:

" Enable nice colors in terminal.
set termguicolors



" SEARCH:

" Enable case insensitive search
set ignorecase

" Make the search case sensitive if a pattern contains an uppercase letter
set smartcase



" SWAP FILES:

" Protect changes between writes.
" Default values:
" updatecount (200 keystrokes);
" updatetime (4 seconds).
set swapfile

" Where to store swap files
set directory=~/.config/nvim/swap//

" Create swap directory if it doesn't exist
if !isdirectory(&directory)
  echom "Creating swap directory"
  call system('mkdir -p ' . &directory)
endif



" UNDO FILES:

" Keep track of undo commands using dedicated files
set undofile

set undolevels=1000

" Where to store undo files
set undodir=~/.config/nvim/undos//

" Create undodir if it doesn't exist
if !isdirectory(&undodir)
  echom "Creating undo directory"
  call system('mkdir -p ' . &undodir)
endif



" TERMINAL MODE:

" Launch the builtin terminal in insert mode.
autocmd TermOpen term://* startinsert

"Exit from insert mode of the builtin terminal by pressing Esc.
tnoremap <Esc> <C-\><C-n>



" AUTOCORRECTION:

iab Implemnet Implement
iab heigth height
iab implemnet implement
iab lcocal local
iab multy multi
iab multypart multipart
iab paralells parallels
iab reecive receive
iab udpate update



" PLUGINS:

" Solorized colorscheme:
" $ git clone https://github.com/icymind/NeoSolarized.git ~/.config/nvim/src/NeoSolarized
" $ mv ~/.config/nvim/src/NeoSolarized/colors ~/.config/nvim/
colorscheme NeoSolarized
" Use 'set background=light' to switch to the Solorized Light theme.

" Git messenger:
" $ mkdir -p ~/.local/share/nvim/site/pack/git-messenger/start
" $ git clone https://github.com/rhysd/git-messenger.vim.git ~/.local/share/nvim/site/pack/git-messenger/start/git-messenger
