---@diagnostic disable: missing-fields

-- INFO: options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = true,
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- INFO: colorscheme
vim.cmd.colorscheme("unokai")

-- INFO: formatting and syntax highlighting (Treesitter)
-- NOTE: We explicitly target the 'main' branch for Neovim 0.12 compatibility
vim.pack.add({ 
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" }
}, { confirm = false })

require("nvim-treesitter.install").update("all")

-- INFO: completion engine
vim.pack.add({ "https://github.com/saghen/blink.cmp" }, { confirm = false })

require("blink.cmp").setup({
  completion = { documentation = { auto_show = true } },
  keymap = {
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
    ['<C-y>'] = { 'select_and_accept', 'fallback' },
    ['<C-e>'] = { 'cancel', 'fallback' },
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<Tab>'] = { 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
  },
  fuzzy = { implementation = "lua" },
})

-- INFO: lsp server configuration (pure native, no plugins)
vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { '.git', 'compile_commands.json' },
})

vim.lsp.config('bashls', {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash' },
  root_markers = { '.git' },
})

vim.lsp.config('ty', {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { '.git', 'pyproject.toml', 'requirements.txt' },
})

-- Enable the servers
vim.lsp.enable('clangd')
vim.lsp.enable('bashls')
vim.lsp.enable('ty')

-- Apply keymaps globally whenever ANY language server attaches to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP Buffer Keymaps',
  callback = function(event)
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to Definition" })
    vim.keymap.set("n", "grf", vim.lsp.buf.format, { buffer = event.buf, desc = "Format File" })
  end,
})

-- INFO: fuzzy finder
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-telescope/telescope.nvim"
}, { confirm = false })

require("telescope").setup({})
local pickers = require("telescope.builtin")

vim.keymap.set("n", "<leader>sf", pickers.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", pickers.live_grep, { desc = "[S]earch by [G]rep" })

-- INFO: keybinding helper
vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

local wk = require("which-key")

wk.setup({
  spec = {
    { "<leader>s", group = "[S]earch", icon = { icon = "", color = "green" } },
  }
})

-- Trouble Diagnostics Helper Functions
local t_d = true
local function toggle_diagnostics()
  t_d = not t_d
  vim.diagnostic.config({ virtual_text = t_d })
  print("Inline diagnostics " .. (t_d and "enabled" or "disabled"))
end

local function trouble_next()
  require("trouble").next({ skip_groups = true, jump = true })
end

local function trouble_prev()
  require("trouble").previous({ skip_groups = true, jump = true })
end

-- Apply custom normal mode mappings
wk.add({
  -- Important Single Mappings
  { "<leader>q", "<cmd>wq<cr>", desc = "Save & Quit", remap = false },
  { "<leader>Q", "<cmd>q!<cr>", desc = "Quit without Saving", remap = false },
  { "<leader>w", "<cmd>w<cr>", desc = "Save File", remap = false },
  { "<leader>s", "<cmd>so %<cr>", desc = "Source File", remap = false },
  { "<leader>t", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", remap = false },
  { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File", remap = false },
  { "<leader>u", "<cmd>Undotree<cr>", desc = "Undo Tree", remap = false },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer", remap = false },

  -- Line Numbers
  { "<leader>n", group = "Numbers", remap = false },
  { "<leader>nn", "<cmd> set nu! rnu! <cr>", desc = "Toggle Numbers" },
  { "<leader>na", "<cmd>set number!<cr>", desc = "Toggle Absolute", remap = false },
  { "<leader>nb", "<cmd>set number! relativenumber!<cr>", desc = "Toggle Both", remap = false },
  { "<leader>nr", "<cmd>set relativenumber!<cr>", desc = "Toggle Relative", remap = false },

  -- Windowing
  { "<leader>W", group = "Window", remap = false },
  { "<leader>W+", "<cmd>resize +2<cr>", desc = "Increase Height", remap = false },
  { "<leader>W-", "<cmd>resize -2<cr>", desc = "Decrease Height", remap = false },
  { "<leader>W<", "<cmd>vertical resize -2<cr>", desc = "Decrease Width", remap = false },
  { "<leader>W=", "<cmd>wincmd =<cr>", desc = "Equalize", remap = false },
  { "<leader>W>", "<cmd>vertical resize +2<cr>", desc = "Increase Width", remap = false },
  { "<leader>Wh", "<cmd>wincmd h<cr>", desc = "Move Left", remap = false },
  { "<leader>Wj", "<cmd>wincmd j<cr>", desc = "Move Down", remap = false },
  { "<leader>Wk", "<cmd>wincmd k<cr>", desc = "Move Up", remap = false },
  { "<leader>Wl", "<cmd>wincmd l<cr>", desc = "Move Right", remap = false },
  { "<leader>Wo", "<cmd>only<cr>", desc = "Maximize", remap = false },
  { "<leader>Wq", "<cmd>close<cr>", desc = "Close Window", remap = false },
  { "<leader>Ws", "<cmd>split<cr>", desc = "Split Horizontal", remap = false },
  { "<leader>Wv", "<cmd>vsplit<cr>", desc = "Split Vertical", remap = false },

  -- Git
  { "<leader>g", group = "Git", remap = false },
  { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame", remap = false },
  { "<leader>gc", "<cmd>Git commit<cr>", desc = "Commit", remap = false },
  { "<leader>gp", "<cmd>Git push<cr>", desc = "Push", remap = false },
  { "<leader>gs", "<cmd>Git status<cr>", desc = "Status", remap = false },

  -- VimTex
  { "<leader>l", group = "LaTeX", remap = false },
  { "<leader>lc", "<plug>(vimtex-compile)", desc = "Compile", remap = false },
  { "<leader>le", "<plug>(vimtex-errors)", desc = "Errors", remap = false },
  { "<leader>li", "<plug>(vimtex-info)", desc = "Info", remap = false },
  { "<leader>ll", "<plug>(vimtex-log)", desc = "Log", remap = false },
  { "<leader>lp", "<plug>(vimtex-stop)", desc = "Pause Compile", remap = false },
  { "<leader>ls", "<plug>(vimtex-status)", desc = "Status", remap = false },
  { "<leader>lt", "<plug>(vimtex-toc-toggle)", desc = "Table of Contents", remap = false },
  { "<leader>lw", "<plug>(vimtex-clean)", desc = "Clean", remap = false },

  -- Mini Map
  { "<leader>m", group = "MiniMap", remap = false },
  { "<leader>mm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle MiniMap", remap = false },
  { "<leader>mr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh MiniMap", remap = false },

  -- Trouble Diagnostics
  { "<leader>x", group = "Trouble", remap = false },
  { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
  { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
  { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
  { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
  { "<leader>xd", toggle_diagnostics, desc = "Toggle Inline Diag.", remap = false },
  { "<leader>xj", trouble_next, desc = "Next Item", remap = false },
  { "<leader>xk", trouble_prev, desc = "Prev Item", remap = false },
})

vim.cmd("packadd nvim.undotree")
