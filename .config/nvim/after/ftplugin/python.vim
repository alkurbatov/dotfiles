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
let b:ale_linters=['pylint']

" Enable python syntax highlight.
packadd python-syntax

" Tweak python syntax highlight.
let g:python_highlight_builtins=1
let g:python_highlight_exceptions=1
let g:python_highlight_string_formatting=1
let g:python_highlight_string_format=1
let g:python_highlight_string_templates=1
let g:python_highlight_func_calls=1
let g:python_highlight_class_vars=1
let g:python_highlight_operators=1
let g:python_highlight_file_headers_as_comments=1
