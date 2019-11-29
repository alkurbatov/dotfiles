" GENERAL:

" Show linenumbers.
set number



" STYLE:

" Enable nice colors in terminal.
set termguicolors



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



" PLUGINS:

" Solorized colorscheme:
" $ git clone https://github.com/icymind/NeoSolarized.git ~/.config/nvim/src/NeoSolarized
" $ mv ~/.config/nvim/src/NeoSolarized/colors ~/.config/nvim/
colorscheme NeoSolarized
" Use 'set background=light' to switch to the Solorized Light theme.

" Git messenger:
" $ mkdir -p ~/.local/share/nvim/site/pack/git-messenger/start
" $ git clone https://github.com/rhysd/git-messenger.vim.git ~/.local/share/nvim/site/pack/git-messenger/start/git-messenger
