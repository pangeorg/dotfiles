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
au BufRead,BufEnter,BufWinEnter,BufRead *.F.inc,*f03 :set filetype=fortran
au BufRead,BufEnter,BufWinEnter,BufRead *.F,*.F90,*.f03,*.f90 :call SetUpFortran()
au BufRead,BufEnter,BufWinEnter,BufRead *.F90,*.f90 :call SetUpFortran90()
au BufRead,BufEnter,BufWinEnter,BufRead *make.inc* :call SetUpMake()
au BufLeave,BufDelete *.F :setlocal colorcolumn=0

function! SetUpMake()
    execute "nmap <buffer> <F9> :call BuildRun()<CR>"
    execute "nmap <buffer> <F10> :call BuildTest()<CR>"
    execute "nmap <buffer> <F8> :call Clean()<CR>"
endfunction


function! SetUpFortran()
    execute "setlocal colorcolumn=".join(range(1,6),",")
    execute "highlight ColorColumn ctermbg=239"
    execute "setlocal shiftwidth=2 tabstop=2 bs=2"
    execute "let b:fortran_free_source=0"
    execute "let b:fortran_fixed_source=1"
    execute "let b:fortran_more_precise=1"
    execute ":vmap <buffer> gc :call FortComment()<CR>"
    execute "nmap <buffer> <F9> :call BuildRun()<CR>"
    execute "nmap <buffer> <F10> :call BuildTest()<CR>"
    execute "nmap <buffer> <F8> :call Clean()<CR>"
    execute "hi Todo ctermfg=255"
endfunction
function! SetUpFortran90()
    execute "setlocal colorcolumn=0"
    execute "let b:fortran_free_source=1"
    execute "let b:fortran_fixed_source=0"
    execute ":vmap <buffer> gc :call FortComment90()<CR>"
endfunction
