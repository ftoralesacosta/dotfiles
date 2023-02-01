-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

    -- Fuzzy Finder and Nav --
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0', 
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use 'nvim-tree/nvim-tree.lua'

    -- Colorschemes --
    use "morhetz/gruvbox"
    use "sainnhe/everforest"
    use "LunarVim/onedarker"
    use 'folke/tokyonight.nvim'

    -- TreeSitter --
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    -- MISC --
    use "tpope/vim-commentary" -- gc<motion> to (un)comment
    use({"kylechui/nvim-surround", tag = "*", --'main' for latest
        config = function()
            require("nvim-surround").setup({})
        end
    })

end)


