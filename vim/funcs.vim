
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTrailingWS()
  exe "normal! mz"
  %s/\s\+$//ge
  exe "normal! `z"
endfunc
autocmd BufWrite *.py :silent call DeleteTrailingWS()

""" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
    return ''
    endfunction
    function! s:Repl()
      let s:restore_reg = @"
        return "p@=RestoreRegister()\<cr>"
        endfunction
vmap <silent> <expr> p <sid>Repl()

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 


function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

function! SwitchProfile()
    if &l:background == 'light'
        set background=dark
        colorscheme slate
    elseif &l:background == 'dark'
        set background=light
        colorscheme hemisu
    endif
endfunction

function! FortComment() range
    for lineo in range(a:firstline,a:lastline)
        let line = getline(lineo)
        let abc = line[0]
        if abc == "*"
            let cl = substitute(line,'^*',' ','e')
            call setline(lineo,cl)
        elseif abc == " "
            let cl = substitute(line,'^ ','*','e')
            call setline(lineo,cl)
        endif
    endfor
endfunction

function! FortComment90() range
    for lineo in range(a:firstline,a:lastline)
        let line = getline(lineo)
        let abc = line[0]
        if abc == "!"
            let cl = substitute(line,'^!',' ','e')
            call setline(lineo,cl)
        elseif abc == " "
            let cl = substitute(line,'^ ','!','e')
            call setline(lineo,cl)
        endif
    endfor
endfunction

function! Get_Git_Dir()
    let git_dir = system("git rev-parse --show-toplevel")
    let no_git_dir = matchstr(git_dir, "^fatal:.*")
    if empty(no_git_dir)
        return git_dir
    else
        return false
    endif
endfunction

function! IsHotB()
    cd %:p:h
    let git_dir = system("git rev-parse --show-toplevel")
    " let no_git_dir = matchstr(git_dir, "^fatal:.*")
    if git_dir =~ "hotb"
        let g:ishotb=1
    else
        let g:ishotb=0
    endif
endfunction

function! BuildClean()
    let current_dir = getcwd()
    cd ~/prometheus/
    execute "AsyncRun make clean && make -j9 WITH_OPENMP=1"
    execute "copen"
    execute 'cd' fnameescape(current_dir)
    execute "wincmd k"
endfunction

function! Build()
    let current_dir = getcwd()
    cd ~/prometheus/
    execute "AsyncRun make -j9"
    execute "copen"
    execute 'cd' fnameescape(current_dir)
    execute "wincmd k"
endfunction

function! HotbN()
    let current_dir = getcwd()
    cd ~/prometheus/
    echo "scp make.inc.hotb.n make.inc.hotb"
    execute "scp make.inc.hotb.n make.inc.hotb"
    execute "copen"
    call BuildHotb()
    execute 'cd' fnameescape(current_dir)
endfunction


