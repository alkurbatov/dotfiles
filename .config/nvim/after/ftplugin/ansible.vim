" Put spaces instead of tabs.
setlocal et

" Convert tabs to spaces.
setlocal expandtab

" Set one tab equal to 2 spaces.
setlocal tabstop=2
setlocal shiftwidth=2

" Load syntax highlight plugin.
packadd ansible-vim

" Setup ansible syntax highlinght.
let g:ansible_attribute_highlight = "an"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1

" Load linter plugin.
packadd ale

" Enable linter.
let b:ale_linters = ['ansible-lint']
