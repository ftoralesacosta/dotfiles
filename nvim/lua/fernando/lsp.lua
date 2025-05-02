local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'rust_analyzer',
    'lua_ls',
    -- 'pylsp',
    'pyright',
    'clangd',
    'yamlls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- This is mostly for Trouble
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error ='E',
        warn = 'W',
        hint = 'h',
        info = 'I'
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
