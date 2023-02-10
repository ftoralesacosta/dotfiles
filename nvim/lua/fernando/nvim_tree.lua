local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
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
--:help nvim-tree.OPTION_NAME


-- Opens tree if dir
local function open_nvim_tree(data)

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()

end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
