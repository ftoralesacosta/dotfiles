local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
--Make sure leader key is set (set.lua)
require('lazy').setup({

     -- Fuzzy Finder --
    'nvim-tree/nvim-tree.lua',

    
	{-- File Explorer --
		'nvim-telescope/telescope.nvim',
		dependencies =  {'nvim-lua/plenary.nvim'},
	},

     -- TreeSitter --
    {-- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require ('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {'nvim-treesitter/playground'}
    },

    -- Colorschemes --
    "morhetz/gruvbox",
    "sainnhe/everforest",
    "LunarVim/onedarker",
    "rose-pine/neovim",
    'dracula/vim',

    -- MISC --
    "zbirenbaum/copilot.lua",
    "tpope/vim-commentary" ,
    "tpope/vim-surround",
    "folke/which-key.nvim",
    "mbbill/undotree",
    'lervag/vimtex',

})


