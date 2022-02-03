-- Install packer.nvim if it does not exist
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Automatically run compile, clean, and update whenever plugins.lua is updated with an autocommand:
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerUpdate
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Let packer manage itself --
  use "wbthomason/packer.nvim"

  -- List of plugins here --
  use "tpope/vim-commentary" -- gc<motion> to (un)comment
  use "oncomouse/vim-surround" -- ys to add, cs to change, ds to delete. f, F for function, t, T for tag
  use "tpope/vim-repeat" -- "." repeats plug-in actions
  -- use 'patstockwell/vim-monokai-tasty'
  use 'folke/tokyonight.nvim'
  -- use 'rakr/vim-one'
  -- use 'marko-cerovac/material.nvim'
  -- use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

