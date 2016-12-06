
"""""""""""""""""""""""""""""""""""""""""""""
"""" SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""

set history=700 " Sets how many lines of history VIM has to remember
filetype plugin on " Enable filetype plugins
filetype indent on
set autoread " Set to auto read when a file is changed from the outside
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set so=7                                        " Set 7 lines to the cursor - when moving vertically using j/k
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set wildmenu                                    " Turn on the WiLd menu
set wildignore=.git\*,.hg\*,.svn\*,*.o,*~,*.pyc " Ignore compiled files
set ruler                                       " Always show current position
set cmdheight=2                                 " Height of the command bar
set hid                                         " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent                  " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
if has('mouse')
  set mouse=a
endif
set ignorecase                                  " Ignore case when searching
set smartcase                                   " When searching try to be smart about cases
set hlsearch                                    " Highlight search results
set incsearch                                   " Makes search act like search in modern browsers
set lazyredraw                                  " Don't redraw while executing macros (good performance config)
set magic                                       " For regular expressions turn magic on
set showmatch                                   " Show matching brackets when text indicator is over them
set mat=2                                       " How many tenths of a second to blink when matching brackets
set noerrorbells                                " No annoying sound on errors
set novisualbell
set tm=500
set foldcolumn=2                                " Add a bit extra margin to the left
set clipboard=unnamedplus                       " yank to + Register
set encoding=utf8                               " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac                            " Use Unix as the standard file type
set timeoutlen=500 ttimeoutlen=0
let g:netrw_liststyle=3                         " Set NETRW look as NERDTree
" set tags=~/.tags/tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Enable syntax highlighting
" colorscheme hemisu
" set background=light
" hi Search cterm=NONE ctermfg=white ctermbg=3
set background=dark
colorscheme sierra
hi Search cterm=NONE ctermfg=black ctermbg=7

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set rtp+=~/.fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab    " Use spaces instead of tabs
set smarttab     " Be smart when using tabs ;)
set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4
set lbr          " Linebreak on 500 characters
set tw=500
set ai           " Auto indent
set si           " Smart indent
set wrap         " Wrap lines

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set shellslash
set scrolloff=8
set switchbuf=usetab
set noeb vb t_vb= " NO BEEP

""""" SESSIONS """""""""""""'
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

""" PASTE WITH AUTOINDENT
set autoindent
set cindent
set smartindent
set autoread

" WORD SEPARATOR
set iskeyword+=-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

