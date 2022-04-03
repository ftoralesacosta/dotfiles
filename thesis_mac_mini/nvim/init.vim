" NOTES
" Although anything in ~/.config/nvim/plugin will automatically be sourced, I find it convenient to individually source config files so as to be able to easily comment out config files that are not needed while leaving them intact.

" GENERAL
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

" TEXT SUPPORT
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/markdown.vim
source $HOME/.config/nvim/plug-config/markdown-preview.vim

" FILE MANAGEMENT
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/gitgutter.vim
source $HOME/.config/nvim/plug-config/signify.vim

" AUTOCOMPLETE
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/deoplete.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim
source $HOME/.config/nvim/plug-config/autopairs.vim
source $HOME/.config/nvim/plug-config/vim-surruound.vim

" ADDITIONAL FUNCTIONS
source $HOME/.config/nvim/plug-config/quickscope.vim

" MAPPINGS
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/keys/mappings.vim

" APPEARANCE
source $HOME/.config/nvim/themes/gruvbox.vim
source $HOME/.config/nvim/themes/airline.vim
