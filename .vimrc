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

"Quality of Life"
Plug 'ervandew/supertab'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'

"Colors"
Plug 'patstockwell/vim-monokai-tasty'
Plug'https://github.com/jeffkreeftmeijer/vim-dim'

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
setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"set smartindent"
set pastetoggle=<f5>
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"--------Relative Numbers-----"
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
"--------Color Scheme---------"
" colorscheme vim-monokai-tasty
colorscheme dim
"--------Mapings---------"
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
