-- which-key.nvim v3 configuration
local wk = require("which-key")

-- Toggle inline diagnostics function
local diagnostics_active = true
local function toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  vim.diagnostic.config({ virtual_text = diagnostics_active })
  print(("Inline diagnostics %s"):format(diagnostics_active and "enabled" or "disabled"))
end

-- Normal mode mappings
wk.add(
  {
    -- Important Single Mappings --
    { "<leader>q", "<cmd>wq<cr>", desc = "Save & Quit", remap = false },
    { "<leader>Q", "<cmd>q!<cr>", desc = "Quit without Saving", remap = false },
    { "<leader>w", "<cmd>w<cr>", desc = "Save File", remap = false },
    { "<leader>s", "<cmd>so %<cr>", desc = "Source File", remap = false },
    { "<leader>t", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", remap = false },
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

    -- File Finder -- 
    { "<leader>f", group = "File Finder", remap = false },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", remap = false },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files", remap = false },
    { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", remap = false },

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
    { "<leader>mm", "<cmd>NeominimapToggle<cr>", desc = "Toggle MiniMap", remap = false },
    { "<leader>mr", "<cmd>NeominimapRefresh<cr>", desc = "Refresh MiniMap", remap = false },

    -- Trouble Diagnostics -- 
    { "<leader>x", group = "Trouble", remap = false },
    { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List", remap = false },
    { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List", remap = false },
    { "<leader>xX", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Buffer Diagnostics", remap = false },
    { "<leader>xd", toggle_diagnostics, desc = "Toggle Inline Diag.", remap = false },
    -- { "<leader>xj", <function>, desc = "Next Item", remap = false },
    -- { "<leader>xk", <function>, desc = "Prev Item", remap = false },
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble", remap = false },
  })

