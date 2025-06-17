vim.g.mapleader = " "
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.cmd "set whichwrap+=<,>,[,],h,l"

--Kill search on escape
vim.keymap.set("n", "<ESC>", ":noh<CR><ESC>", opts)

--prevents comment on newline 
vim.api.nvim_exec([[ autocmd BufEnter * set fo-=o fo-=c fo-=r ]],false)
-- vim.o.formatoptions = 'jqlr' --how it's supposet to work
-- conflict from ~/nvim-macos/share/nvim/runtime/ftplugin/lua.vim line 19

vim.opt.cursorline = true         -- highlight the current line
vim.opt.cmdheight = 1             -- more space in the neovim command line for displaying messages
vim.cmd [[set mouse=]]            -- use mouse to scroll line by line
vim.opt.wrap.timeoutlen = 100     -- time (ms) to wait for a mapped sequence to complete
vim.opt.conceallevel = 0          -- so that `` is visible in markdown files
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- vim.g.copilot_no_tab_map = true
vim.g.neominimap ={
    auto_enable = false}


local status_ok, onedark = pcall(require, 'onedark')
if status_ok then
    onedark.setup {
        style = 'cool' --'darker', 'deep', or 'warm'
    }
    onedark.load()
end

