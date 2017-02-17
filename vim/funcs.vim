
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTrailingWS()
  exe "normal! mz"
  %s/\s\+$//ge
  exe "normal! `z"
endfunc
autocmd BufWrite *.py :silent call DeleteTrailingWS()
autocmd BufWrite *.F,*.F90,*.f90,*.f03 :silent call DeleteTrailingWS()

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

function! Clean()
    let current_dir = getcwd()
    if current_dir =~ "prometheus"
        echo "clean PROM /build"
        cd ~/prometheus/
    elseif current_dir =~ "hotb"
        echo "clean HOTB /build"
        cd ~/hotb/
    else
        echo "Wrong Folder"
        echo current_dir
    endif
    execute "AsyncRun make clean"
    execute "copen"
    execute 'cd' fnameescape(current_dir)
    execute "wincmd k"
endfunction

function! BuildRun()
    let current_dir = getcwd()
    if current_dir =~ "prometheus"
        echo "BUILD PROM FOR RUNNING"
        cd ~/prometheus/
    elseif current_dir =~ "hotb"
        echo "BUILD HOTB FOR RUNNING"
        cd ~/hotb/
    else
        echo "Wrong Folder"
        echo current_dir
    endif
    execute "AsyncRun make -j9 WITH_OPT=1 WITH_OPENMP=1"
    execute "copen"
    execute 'cd' fnameescape(current_dir)
    execute "wincmd k"
endfunction

function! BuildTest()
    let current_dir = getcwd()
    if current_dir =~ "prometheus"
        echo "BUILDING PROM FOR TESTING"
        cd ~/prometheus/
    elseif current_dir =~ "hotb"
        echo "BUILDING HOTB FOR TESTING"
        cd ~/hotb/
    else
        echo "Wrong Folder"
        echo current_dir
    endif
    execute "AsyncRun make -j9 DEBUG=HIGH"
    execute "copen"
    execute 'cd' fnameescape(current_dir)
    execute "wincmd k"
endfunction

