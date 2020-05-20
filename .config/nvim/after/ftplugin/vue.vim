" Put spaces instead of tabs.
setlocal et

" Convert tabs to spaces.
setlocal expandtab

" Set one tab equal to 2 spaces.
setlocal tabstop=2
setlocal shiftwidth=2

" Load linter.
packadd ale

" Run both javascript and vue linters for vue files.
let b:ale_linter_aliases = ['javascript', 'vue']

" Select the eslint and vls linters.
let b:ale_linters = ['eslint', 'vls']

" Load Vue.js syntax highlight.
packadd vim-vue-plugin

" Highlight vue attribute value as expression instead of string.
let g:vim_vue_plugin_highlight_vue_attr = 1
