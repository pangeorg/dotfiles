set nocompatible              " be iMproved, required

let g:plug_url_format="http://git::@github.com/%s.git"

call plug#begin('~/.dotfiles/vim/plugs')
Plug 'tpope/vim-fugitive'
Plug 'AlessandroYorba/Sierra'
Plug 'tmhedberg/SimpylFold'
Plug 'itchyny/lightline.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'
Plug 'L9'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/AutoComplPop'
Plug 'junegunn/vim-easy-align'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'vim-scripts/ctags.vim'
Plug 'tpope/vim-repeat'
Plug 'skywind3000/asyncrun.vim'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
call plug#end()

source ~/.dotfiles/vim/plugins_config.vim
source ~/.dotfiles/vim/mappings.vim
source ~/.dotfiles/vim/funcs.vim
source ~/.dotfiles/vim/options.vim
source ~/.dotfiles/vim/filetypes.vim
