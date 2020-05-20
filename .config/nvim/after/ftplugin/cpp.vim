" Set one tab equal to 4 spaces
setlocal tabstop=4
setlocal shiftwidth=4

" Convert tabs to spaces
setlocal expandtab

" Load linter plugin
packadd ale

" Enable linter
let b:ale_linters = ['cppcheck']

