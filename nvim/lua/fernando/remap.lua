vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.wq)
vim.keymap.set("n", "<leader>s", vim.cmd.so)
vim.keymap.set("n", "<leader>n", "<cmd> set nu! rnu! <cr>")
vim.keymap.set("n", "<ESC>", ":noh<CR><ESC>", opts) --Kill search on escape
