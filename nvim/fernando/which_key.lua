local wk = require("which-key")

wk.register(
    {
        f = { name = " File Finder", 
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            g = { "<cmd>Telescope git_files<cr>", "Git Files" },
            l = { "<cmd>Telescope live_grep<cr>", "Live Grep [ripgrep]" },
        },

        t = { "<cmd>Telescope live_grep<cr>", "Text Finder [ripgrep]" },

        u = { "<cmd> UndotreeToggle <cr>", "Undo Tree" },

        n = {name = " NumberLines",
            n = {"<cmd> set nu! rnu! <cr>", "Toggle Numbers"},
            a = {"<cmd> set nu! <cr>", "Absolute Numbers"},
            r = {"<cmd> set rnu! <cr>", "Relative Numbers"},
        },

        l = {name = " LaTeX",
            i = {"<plug>(vimtex-info)","VimtexInfo"},
            c = {"<plug>(vimtex-compile)","Compile"},
            l = {"<plug>(vimtex-log)","Log"},
            t = {"<plug>(vimtex-toc-toggle)","Table of Contents"},
            p = {"<plug>(vimtex-stop)","Pause Compile"},
            s = {"<plug>(vimtex-status)","Status"},
            w = {"<plug>(vimtex-clean)","Wipe (Clean)"},
            e = {"<plug>(vimtex-errors)","Errors"},
        },

        a = {name = "Animations",
            -- r = {"<cmd> CellularAutomaton make_it_rain <cr>", "Make it Rain"},
            l = {"<cmd> CellularAutomaton game_of_life <cr>", "Game of Life"},
            r = {"<cmd> CellularAutomaton make_it_rain <cr>", "Make it Rain"},
            -- d = {"<cmd> Zone dvd <cr>", "Make it Rain"},
            d = {"<plug>(CellularAutomaton game_of_life)","DVD"},
        },

        e = {"<cmd> NvimTreeToggle <cr>", "Explorer (NvimTree)"},
        w = {"<cmd> w  <cr>", "Write File"},
        q = {"<cmd> wq <cr>", "Quit File"},
        s = {"<cmd> so <cr>", "Source File"},
        Q = {"<cmD> q  <cr>", "Quit, w/o Saveing"},
    },

    { prefix = "<leader>" })

-- Examples of Regular KeyMaps --
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>w", vim.cmd.w)
-- vim.keymap.set("n", "<leader>q", vim.cmd.wq)
-- vim.keymap.set("n", "<leader>s", vim.cmd.so)

-- s = { function() 
--     Telescope grep_string({search = vim.fn.input("Grep > ")}) 
--         end), "Grep"
--     },
-- vim.keymap.set('n', '<leader>fs', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") } );
-- end)


