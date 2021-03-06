""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
nnoremap <F3> :MBEToggle<cr>
let g:miniBufExplVSplit = 20
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplBuffersNeeded = 1
""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" CTAGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:tagbar_ctags_bin="/afs/mpa/home/georgsto/.local/bin/ctags"
" let g:easytags_cmd = '/afs/mpa/home/georgsto/.local/bin/ctags'
" let g:ctags_path='/afs/mpa/home/georgsto/.local/bin/ctags'
let g:ctags_statusline=1
let g:ctags_title=1
let g:ctags_regenerate=0
nnoremap <F5> <ESC>:Tagbar<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'readonly', 'filename','modified' ],['tagbar']],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \ [ 'filetype'],['asyncstatus'] ]
      \ },
      \ 'inactive': {
      \   'right': [ [ 'fileformat', 'fileencoding' ]]
      \ },
      \ 'component': {
      \   'tagbar': '%{tagbar#currenttag("[%s]", "")}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'asyncstatus': '%{asyncrun#status()}',
      \   'fileformat': '',
      \   'fileencoding': '',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \   'bufnum': '%n'
      \ },
      \ 'separator': { 'left': '>>', 'right': '<' },
      \ 'subseparator': { 'left': '>>', 'right': '<' }
      \ }
function! Asyncstatus()
    let l=asyncrun#status()
    if l
        " return '%{g:asyncrun_status}'
        return '%{asyncrun#status()}'
    else
        return 'lala'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" TEX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:LatexBox_latexmk_async=0
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
let g:LatexBox_viewer='/opt/kde4-800/bin/okular'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ALIGN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" EXPAND REGION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
