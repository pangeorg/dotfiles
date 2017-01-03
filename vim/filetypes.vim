""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python set foldmethod=indent
au FileType python setlocal colorcolumn=0
au FileType python syn keyword pythonDecorator True None False self
au BufLeave,BufDelete *.py :setlocal colorcolumn=0
au BufAdd,BufRead,BufEnter,BufWinEnter *.py :vmap <buffer> gc <Plug>Commentary
au BufAdd,BufRead,BufEnter,BufWinEnter *.py :hi Folded ctermbg=239

""""""""""""""""""""""""""""""
" => LATEX section
"""""""""""""""""""""""""""""""
" autocmd BufWritePost *.tex Dispatch! pdflatex %
" autocmd FileType tex nnoremap <F9> <ESC>:w<CR><ESC>:!pdflatex % && texclean<CR><CR>
" autocmd FileType tex inoremap <F9> <ESC>:w<CR><ESC>:!pdflatex % && texclean<CR><CR>
"
""""""""""""""""""""""""""""""
" => MARKDOWN
"""""""""""""""""""""""""""""""

autocmd BufRead,BufEnter,BufNewFile *.md setlocal filetype=markdown 
autocmd BufRead,BufEnter,BufNewFile *.md :let b:vim_markdown_math=1
au BufAdd,BufRead,BufEnter,BufWinEnter *.md :nmap <buffer> <leader>tf :silent! exec "TableFormat"<CR>


""""""""""""""""""""""""""""""
" => FORTRAN
"""""""""""""""""""""""""""""""
" au BufRead,BufEnter *.F :highlight ColorColumn ctermbg=255
au BufRead,BufEnter *.F.inc,*f03 :set filetype=fortran
au BufRead,BufEnter *.F,*.F90,*.f03,*.f90 :highlight ColorColumn ctermbg=239
au BufAdd,BufRead,BufEnter *.F,*.F90,*f03,*.f90 :execute 'setlocal colorcolumn='.join(range(1,6),',')
au BufLeave,BufDelete *.F,*.F90,*f03,*.f90 :setlocal colorcolumn=0
au BufAdd,BufRead,BufEnter,BufWinEnter *.F,*.F90,*inc.hotb,*f03,*.f90 :nmap <buffer> <F9> :call BuildClean()<CR>
au BufAdd,BufRead,BufEnter,BufWinEnter *.F,*.F90,*inc.hotb,*f03,*.f90 :nmap <buffer> <F10> :call Build()<CR>
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :vmap <buffer> gc :call FortComment()<CR>
au BufAdd,BufRead,BufEnter,BufWinEnter *.F90,*.f90 :vmap <buffer> gc :call FortComment90()<CR>
au BufAdd,BufRead,BufEnter,BufWinEnter *.F,*F90,*f03,*f90 :setlocal shiftwidth=2 tabstop=2
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :execute 'let b:fortran_free_source=0'
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :execute 'let b:fortran_fixed_source=1'
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :execute 'let b:fortran_more_precise=1'
au BufAdd,BufRead,BufEnter,BufWinEnter *.f90,*.F90,*f03 :execute 'let b:fortran_free_source=1'
au BufAdd,BufRead,BufEnter,BufWinEnter *.f90,*.F90,*f03 :execute 'let b:fortran_fixed_source=0'
au BufAdd,BufRead,BufEnter,BufWinEnter *.f90,*.F90,*f03 :execute 'let b:fortran_more_precise=1'
