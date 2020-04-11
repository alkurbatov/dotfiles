" Don't show linenumbers, it makes harder copy-pasting.
setlocal nonumber

" Autmatically wrap long lines
setlocal formatoptions+=t
setlocal textwidth=72

" Visually show the maximum line length
setlocal colorcolumn=73

" Warn if the first line is too long
match ErrorMsg /\%1l.\%>51v/

" Enable spell checking
setlocal spell spelllang=en_us

