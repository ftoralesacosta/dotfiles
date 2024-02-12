-- Setup Lazy -- 
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
--leader key must be set before setup (done in set.lua)

require('lazy').setup({

    -- File Explorer Tree  --
    'nvim-tree/nvim-tree.lua',

    -- Open Big Files Quickly --
    'LunarVim/bigfile.nvim',

    {-- Fuzzy Finder (Text or Files) --
        'nvim-telescope/telescope.nvim',
        dependencies =  {'nvim-lua/plenary.nvim'},
    },


    -- TreeSitter --
    {-- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require ('nvim-treesitter.install').update /
                { with_sync = true })
        end,
        dependencies = {'nvim-treesitter/playground'}
    },


    {-- LSP --
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

    {--Trouble--
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    {--LeetCode--
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
            lang = "python",
        },
    },

    { -- Chat GPT for Coding -- 
        "dpayne/CodeGPT.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require("codegpt.config")
        end
    },


    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = true
    },

    -- Colorschemes --
    "morhetz/gruvbox",
    "sainnhe/everforest",
    "LunarVim/onedarker",
    "rose-pine/neovim",
    'dracula/vim',
    'navarasu/onedark.nvim',

    -- MISC --
    'folke/which-key.nvim',
    "tpope/vim-commentary" ,
    "tpope/vim-surround",
    -- "tpope/vim-fugitive",
    "mbbill/undotree",
    'lervag/vimtex',
    'eandrju/cellular-automaton.nvim',
})

