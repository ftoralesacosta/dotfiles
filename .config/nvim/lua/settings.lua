vim.opt.cursorline = false
vim.opt.tabline = '2'
vim.opt.syntax = "enable"
vim.opt.inccommand = 'nosplit' --replace live preview %s
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_exec([[ autocmd BufEnter * set fo-=o fo-=c fo-=r ]],false)
