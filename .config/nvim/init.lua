---------------
-- Lua Files --
---------------
require('settings')
require('plugins')
require('maps')
require('colorscheme')
require('lsp')
require('completion')

----------------
-- TreeSitter --
----------------
local configs = require'nvim-treesitter.configs'
configs.setup
	{	--"maintained" list does not fully compile
		ensure_installed = "bash","cpp","python","lua",
				"latex","yaml","cmake","c","c_sharp",
		highlight = { enable = true,}, --enable highlighting
		indent = { enable = true,} --default is disabled anyways
	}


