---------------
-- Lua Files --
---------------
require('impatient')
require('options')
require('plugins')
require('maps')
require('colorscheme')
require('completion')
require('whichkey')
require('tele_scope')
require('nvim_tree')

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
