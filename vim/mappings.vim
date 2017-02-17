"""""""""""""""""""""""""""""""""""""""""""""
"""" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" search visual selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" better up/down movement
map j gj
map k gk
map "," ?

" set no highlight
map <silent> <leader><cr> :noh<cr>

" faster window navigation
" nnoremap <C-Space>j <C-W>j
" nnoremap <C-Space>h <C-W>h

" managing buffers
nnoremap <leader>bd :Bclose<cr>
nnoremap <leader>ba :1,1000 bd!<cr>
nnoremap <leader>be :edit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>bh :edit ~/
nnoremap <leader>ve :vsplit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

""" BROWSE THROUGH BUFFERS FAST
map <C-k> <esc>:bn<CR>
map <C-j> <esc>:bp<CR>
" nnoremap <C-w> <esc><C-W>k
" nnoremap <C-s> <esc><C-W>j
" nnoremap <C-c> <esc><C-W>l
" nnoremap <C-x> <esc><C-W>h
"
""" Quote selection
vmap q <Esc>`>a'<Esc>`<i'<Esc>
vmap [ <Esc>`>a]<Esc>`<i[<Esc>
vmap { <Esc>`>a}<Esc>`<i{<Esc>
"
""" Fast CNext Copen ..
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>


" Useful mappings for managing splits
nnoremap <leader>vs :vsplit <c-r>=expand("%:p:h")<cr>/

" Remap VIM 0 to first non-blank character
map 0 ^
map 9 $h

" set paste
map <leader>pp :setlocal paste!<cr>

" easy pasting from clipboard with <leader>p
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>callistdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" select text just pasted
noremap gV `[v`]
map q: :q

" Copy everything in matching bracket and append
noremap $y <esc>%v%y%p<esc>

" Open LEXPLORE
nnoremap <F4> <ESC>:Lexplore<CR>

" Find files faast
nnoremap <C-f> :FZF 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno <C-D> <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

" cnoremap <C-W> <Up>
" cnoremap <C-S> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
vnoremap $a <esc>`>a)<esc>`<inp.array(<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

"""quicksave"""
" nnoremap <F1> <Esc>:w<cr><Esc>:mksession! ~/.vim_runtime/temp_dirs/sessions/quicksave.vim<cr>
"""quickload"""
" nnoremap <F2> <Esc>:source ~/.vim_runtime/temp_dirs/sessions/quicksave.vim<cr>

inoremap <C-e> <ESC>$a
inoremap <C-a> <ESC>0a
nnoremap <C-e> <ESC>$<ESC>
nnoremap <C-a> <ESC>0<ESC>
inoremap <C-b> <ESC>0a
nnoremap <C-b> <ESC>0<ESC>

""" FAST TO NORMAL MODE
inoremap <C-]> <esc>

""" CMD MODE MAPPINGS
cno <C-r>y <C-R>"
cno <C-r>/ <C-R>/

""" MAP LEADER H to TOGGLE HIGHLIGHT SEARCH
nnoremap <leader>hl <ESC>:set hls!<CR>
vnoremap <leader>hl <ESC>:set hls!<CR>gv
inoremap <leader>hl <ESC>:set hls!<CR>a

