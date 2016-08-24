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
let g:tagbar_ctags_bin="/afs/mpa/home/georgsto/.local/bin/ctags"
let g:easytags_cmd = '/afs/mpa/home/georgsto/.local/bin/ctags'
let g:ctags_path='/afs/mpa/home/georgsto/.local/bin/ctags'
let g:ctags_statusline=1
let g:ctags_title=1
let g:ctags_regenerate=0
nnoremap <F5> <ESC>:Tagbar<CR>

"""
""" MRU
"""
let MRU_File = '~/.vim_runtime/.mru_files'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ],['tagbar']],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \ [ 'filetype'],['bufnum' ] ]
      \ },
      \ 'inactive': {
      \   'right': [ [ 'fileformat', 'fileencoding' ]]
      \ },
      \ 'component': {
      \   'tagbar': '%{tagbar#currenttag("[%s]", "")}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_start_key='<C-m>'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" TEX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimtex_latexmk_enabled=1
let g:vimtex_view_general_viewer='okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

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
