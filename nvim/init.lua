---------------
-- Lua Files --
---------------
require('plugins')  --plugins.lua
require('maps')     -- maps.lua
require('settings') --settings.lua
require('colorscheme') --colorscheme.lua
--require('statusline')  -- lua/statusline.lua

----------------
-- TreeSitter --
----------------
local configs = require'nvim-treesitter.configs'
configs.setup
	{	--"maintained" list does not fully compile
		ensure_installed = "bash","cpp","python","lua","latex","yaml","cmake","c","c_sharp",
		highlight = { enable = true,}, --enable highlighting
		indent = { enable = true,} --default is disabled anyways
	}

---------
-- LSP --
---------
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local servers = {
    "bashls", --bash
    "clangd", --c++
    "cmake", --cmake
    "ccls", --c
    "pyright", --python
    "sumneko_lua", --lua
    "ltex", --latex, markdown
    "yamlls" --YAML
}

-- if not already installed, install it.
for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            -- Make sure not to also use the "catch-all" lsp_installer.on_server_ready()
            local opts = {}
            server:setup(opts)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    end
end
