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

--Make sure leader key is set before this setup call
--done in set.lua
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

    {
        -- LSP --
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
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


