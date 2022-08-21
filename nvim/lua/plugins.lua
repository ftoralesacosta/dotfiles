local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- install plugins here --
return require('packer').startup(function(use)

	-- Let packer manage itself --
  use "wbthomason/packer.nvim"

  -- Text Editing Plugins--
  use "tpope/vim-commentary" -- gc<motion> to (un)comment
  use "oncomouse/vim-surround" -- ys to add, cs to change, ds to delete. f, F for function, t, T for tag
  use "tpope/vim-repeat" -- "." repeats plug-in actions
  use "antoinemadec/FixCursorHold.nvim" -- fix lsp highlight
  use "folke/which-key.nvim"
  
  --Prerequisite Plugins (for Telescope, and others)
  -- use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- ColorSchemes --
  use "morhetz/gruvbox"
  use "sainnhe/everforest"
  use "LunarVim/onedarker"
  use "folke/tokyonight.nvim"

  -- LSP--
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- CMP --
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions

  use "hrsh7th/cmp-nvim-lsp" -- lsp completions 
  use "hrsh7th/cmp-nvim-lua" -- helps with config

  -- Snippets --
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "L3MON4D3/LuaSnip" -- needed for "require('luasnip')"
  use "rafamadriz/friendly-snippets"

  -- TreeSitter --
  use {'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
      }

  -- Telescope & Finders  --
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  -- REQUIRED: brew install ripgrep and https://github.com/sharkdp/fd

  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Miscelanious --
  use "dstein64/vim-startuptime"
  use 'lewis6991/impatient.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
