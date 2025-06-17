-- which-key.nvim v3 configuration
local wk = require("which-key")

-- Normal mode mappings
wk.add(
    {
        -- Important Single Mappings --
        { "<leader>q", "<cmd>wq<cr>", desc = "Save & Quit", remap = false },
        { "<leader>Q", "<cmd>q!<cr>", desc = "Quit without Saving", remap = false },
        { "<leader>w", "<cmd>w<cr>", desc = "Save File", remap = false },
        { "<leader>s", "<cmd>so %<cr>", desc = "Source File", remap = false },
        { "<leader>t", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", remap = false },
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File", remap = false },
        { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree", remap = false },
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer", remap = false },

        -- Line Numbers --
        { "<leader>n", group = "Numbers", remap = false },
        { "<leader>nn", "<cmd> set nu! rnu! <cr>", desc = "Toggle Numbers" },
        { "<leader>na", "<cmd>set number!<cr>", desc = "Toggle Absolute", remap = false },
        { "<leader>nb", "<cmd>set number! relativenumber!<cr>", desc = "Toggle Both", remap = false },
        { "<leader>nr", "<cmd>set relativenumber!<cr>", desc = "Toggle Relative", remap = false },

        -- Windowing --
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

        -- { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files", remap = false }, FIXME: Add this instead to "<leader>gf"

        -- Git --
        { "<leader>g", group = "Git", remap = false },
        { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame", remap = false },
        { "<leader>gc", "<cmd>Git commit<cr>", desc = "Commit", remap = false },
        { "<leader>gp", "<cmd>Git push<cr>", desc = "Push", remap = false },
        { "<leader>gs", "<cmd>Git status<cr>", desc = "Status", remap = false },

        -- VimTex --
        { "<leader>l", group = "LaTeX", remap = false },
        { "<leader>lc", "<plug>(vimtex-compile)", desc = "Compile", remap = false },
        { "<leader>le", "<plug>(vimtex-errors)", desc = "Errors", remap = false },
        { "<leader>li", "<plug>(vimtex-info)", desc = "Info", remap = false },
        { "<leader>ll", "<plug>(vimtex-log)", desc = "Log", remap = false },
        { "<leader>lp", "<plug>(vimtex-stop)", desc = "Pause Compile", remap = false },
        { "<leader>ls", "<plug>(vimtex-status)", desc = "Status", remap = false },
        { "<leader>lt", "<plug>(vimtex-toc-toggle)", desc = "Table of Contents", remap = false },
        { "<leader>lw", "<plug>(vimtex-clean)", desc = "Clean", remap = false },

        -- Mini Map --
        { "<leader>m", group = "MiniMap", remap = false },
        { "<leader>mm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle MiniMap", remap = false },
        { "<leader>mr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh MiniMap", remap = false },

    })


    -- Trouble Diagnostics --

    local t_d = true  --trouble diagnostics
    function toggle_diagnostics()
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

    wk.add({
        { "<leader>x", group = "Trouble", remap = false },
        {"<leader>xx","<cmd>Trouble diagnostics toggle<cr>",desc = "Diagnostics (Trouble)"},
        {"<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)"},
        -- {"<leader>cs","<cmd>Trouble symbols toggle focus=false<cr>",desc = "Symbols (Trouble)"},
        -- {"<leader>cl","<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        -- desc = "LSP Definitions / references / ... (Trouble)"},
        {"<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)"},
        {"<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)"},
        { "<leader>xd", toggle_diagnostics, desc = "Toggle Inline Diag.", remap = false },
        { "<leader>xj", trouble_next, desc = "Next Item", remap = false },
        { "<leader>xk", trouble_prev, desc = "Prev Item", remap = false },
    }, {mode = 'n'})
