" Put spaces instead of tabs
setlocal et

" Convert tabs to spaces
setlocal expandtab

" Set one tab equal to 4 spaces
setlocal tabstop=4
setlocal shiftwidth=4

" Load linter plugin.
packadd ale

" Enable linter.
let b:ale_linters = ['shellcheck']
