" set leader key
let g:mapleader = "\<Space>"

set autoread " trigger `autoread` when files changes on disk
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  " autocmd FileChangedShellPost * " notification after file change
  "   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
set complete+=kspell                    " set spell spelllang=en_gb
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_gb
syntax enable                           " Enables syntax highlighing
set path+=**
set hidden                              " Required to keep multiple buffers open multiple buffers
"set nowrap                              " Display long lines as just one line
set linebreak                           " Prevents words from breaking over line
set breakindent                         " Indent wrapped lines
  let &showbreak='  '                   " Indent amount
set encoding=UTF-8                      " The encoding displayed 
" set guifont=Hack\ Nerd\ Font\ 11        " Set font
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
" set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
" set expandtab                           " Converts tabs to spaces
" set tabstop=2                           " Insert 2 spaces for a tab
" set shiftwidth=2                        " Change the space characters inserted for indentation
" set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
" set autoindent                          " Good auto indent
" set cindent                             "better C-language indent 
" set indentexpr=""                       " Was changing line indenting?
" set indentkeys=""                       " Was changing line indenting?
" set laststatus=0                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tab bar at top 
set noshowmode                          " We don't need to see things like -- INSERT -- 
" set nobackup                            " This is recommended by coc
" set nowritebackup                       " This is recommended by coc

"Adapted from local .vimrc
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
" set backupdir=~/.config/nvim/backup
" set directory=~/.config/nvim/swap//
set scrolloff=7

" let &backupdir = expand('~/.config/nvim/backup//') " Folder for backup files
" if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
set updatetime=300                      " Faster completion
" set timeoutlen=100                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
" set clipboard=unnamedplus               " Copy paste between vim and everything else

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
"--------Color Scheme---------"

filetype plugin indent on

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
set belloff=all

" prevent auto-comment next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
