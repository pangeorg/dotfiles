""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python set foldmethod=indent
au FileType python setlocal colorcolumn=0
au FileType python syn keyword pythonDecorator True None False self
au BufLeave,BufDelete *.py :setlocal colorcolumn=0
au BufAdd,BufRead,BufEnter,BufWinEnter *.py :vmap <buffer> gc <Plug>Commentary

""""""""""""""""""""""""""""""
" => IDL section
"""""""""""""""""""""""""""""""

autocmd FileType idlang set commentstring=;\ %s
autocmd FileType pro set commentstring=;\ %s

""""""""""""""""""""""""""""""
" => LATEX section
"""""""""""""""""""""""""""""""
autocmd BufWritePost *.tex Dispatch! pdflatex %
autocmd FileType tex nnoremap <F9> <ESC>:w<CR><ESC>:!pdflatex % && texclean<CR><CR>
autocmd FileType tex inoremap <F9> <ESC>:w<CR><ESC>:!pdflatex % && texclean<CR><CR>
"
""""""""""""""""""""""""""""""
" => MARKDOWN
"""""""""""""""""""""""""""""""

autocmd BufRead,BufEnter,BufNewFile *.md setlocal filetype=markdown 


""""""""""""""""""""""""""""""
" => FORTRAN
"""""""""""""""""""""""""""""""
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :nmap <buffer> <F9> :call BuildHotb()<CR>
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :vmap <buffer> gc :call FortComment()<CR>
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :setlocal shiftwidth=2 tabstop=2
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :let b:fortran_free_source=0
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :let b:fortran_fixed_source=1
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :let b:fortran_more_precise=1
au BufAdd,BufRead,BufEnter,BufWinEnter *.F :let b:fortran_have_tabs=0
" au BufRead,BufEnter *.F :highlight ColorColumn ctermbg=255
au BufRead,BufEnter *.F :highlight ColorColumn ctermbg=239
au BufAdd,BufRead,BufEnter *.F :execute 'setlocal colorcolumn='.join(range(1,6),',')
au BufLeave,BufDelete *.F :setlocal colorcolumn=0
" au! BufAdd,BufRead,BufEnter *.F execute 'setlocal colorcolumn='.join(range(1,6)+range(73,800),',')
" if &l:background == 'light'
    " au! FileType fortran highlight ColorColumn ctermbg=255
    " au! BufRead,BufEnter *.F highlight ColorColumn ctermbg=255
" else
"     au! BufRead,BufEnter *.F highlight ColorColumn ctermbg=8
" endif

