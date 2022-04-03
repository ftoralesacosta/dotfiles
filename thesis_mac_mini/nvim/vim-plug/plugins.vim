" auto-install plugins upon starting
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" LaTeX Support
    Plug 'lervag/vimtex'
    Plug 'dense-analysis/ale' " LaTeX Linting

" Markdown
    Plug 'gabrielelana/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Plug 'godlygeek/tabular'

"FILE MANAGEMENT

" Startup Screen
    Plug 'mhinz/vim-startify'
    
" File Explorer
    Plug 'ryanoasis/vim-devicons' "adds icons to coc-explorer
    
" Fuzzy Finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    
" Git Integration
    Plug 'mhinz/vim-signify'
    Plug 'airblade/vim-gitgutter'
    " Plug 'tpope/vim-fugitive'

" AUTOCOMPLETE
    " Plug 'ervandew/supertab'
" Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
      " Keeping up to date with master
      " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
    " Plug 'Valloric/YouCompleteMe'
    
" Snippets
    Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

" Auto pairs and surround for '(' '[' '{' etc.
    Plug 'jiangmiao/auto-pairs' 
    Plug 'tpope/vim-surround' 
    Plug 'machakann/vim-sandwich' 
    Plug 'tpope/vim-repeat' 
    

" ADDITIONAL FUNCTIONS

" Comments
    Plug 'tpope/vim-commentary'
    " Plug 'jbgutierrez/vim-better-comments'

" Quick Movements in Text
    Plug 'unblevable/quick-scope'
    Plug 'easymotion/vim-easymotion'
    " Plug 'justinmk/vim-sneak'
    
" Undo tree
    Plug 'mbbill/undotree'
    
" Multiple Cursors
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " Plug 'terryma/vim-multiple-cursors'

" Browser Support
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" MAPPINGS

" Look Up Key Bindings
    Plug 'liuchengxu/vim-which-key'
    

" APPEARANCE

" Themes 
    Plug 'morhetz/gruvbox'  " Source grubox theme
    " Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
    " Plug 'joshdick/onedark.vim'
    
" Satus Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    





call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
