local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                enable = true,
            },
        },
    },
    git = {
        enable = false
    },
}


-- Open Tree with Directory input
local function open_nvim_tree(data)

    local directory = vim.fn.isdirectory(data.file) == 1
    if not directory then
        return
    end

    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()

end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
