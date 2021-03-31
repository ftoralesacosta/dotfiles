"--------Basic--------"
set nocompatible
syntax on

"--------Plug---------"
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged') "calls filetype indent and syntax enable

Plug 'patstockwell/vim-monokai-tasty'
Plug 'ervandew/supertab'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'

call plug#end()

"--------Usability---------"
filetype indent plugin on
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set ruler
set laststatus=2
set confirm
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set cindent	
"set smartindent"
set pastetoggle=<f5>
"--------Relative Numbers-----"
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
"--------Color Scheme---------"
"colorscheme vim-monokai-tasty"
"--------Mapings---------"
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
