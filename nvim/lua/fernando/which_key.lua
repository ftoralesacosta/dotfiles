local wk = require("which-key")
local chatgpt = require("chatgpt")

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader>gl", "<cmd>CellularAutomaton game_of_life<CR>");
vim.keymap.set("n", "<leader>dvd", "<cmd>Zone  dvd<CR>");


wk.register(
    {
        f = { name = " File Finder",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            g = { "<cmd>Telescope git_files<cr>", "Git Files" },
            l = { "<cmd>Telescope live_grep<cr>", "Live Grep [ripgrep]" },
        },

        t = { "<cmd> Telescope live_grep<cr>", "Text Finder [ripgrep]" },

        u = { "<cmd> UndotreeToggle <cr>", "Undo Tree" },


        x = {name = "Trouble",
            x = {"<cmd> TroubleToggle <cr>", "TroubleToggle"},
            r = {"<cmd> TroubleRefresh <cr>", "TroubleRefresh"},
            w = {function() require("trouble").open("workspace_diagnostics") end,
                "open workspace_diagnostics"},
            q = {function() require("trouble").open("quickfix") end,
                "quickfix"},
            k = {function() require("trouble").previous({skip_groups = false,
                jump = true}) end, "previous"},
            j = {function() require("trouble").next({skip_groups = true,
                jump = true}) end, "next"},
            -- R = {function() require("trouble").open("lsp_references") end,
                -- "open LSP?"},
        },


        n = {name = " NumberLines",
            n = {"<cmd> set nu! rnu! <cr>", "Toggle Numbers"},
            a = {"<cmd> set nu! <cr>", "Absolute Numbers"},
            r = {"<cmd> set rnu! <cr>", "Relative Numbers"},
        },

        g = {name = "FuGitive",
        },

        c = {name = "copilot",
            e = {"<cmd> Copilot enable <cr> <cmd> Copilot status <cr>",
                "Enable Copilot"},
            d = {"<cmd> Copilot disable <cr> <cmd> Copilot status <cr>",
                "Disable Copilot"},
            p = {"<cmd> Copilot panel <cr>", "Panel"},
        },

        p = {name = "ChatGPT",
            e = {
                function()
                    chatgpt.edit_with_instructions()
                end,
                "Edit with instructions",
            },
        },

        l = {name = "LaTeX",
            i = {"<plug>(vimtex-info)","VimtexInfo"},
            c = {"<plug>(vimtex-compile)","Compile"},
            l = {"<plug>(vimtex-log)","Log"},
            t = {"<plug>(vimtex-toc-toggle)","Table of Contents"},
            p = {"<plug>(vimtex-stop)","Pause Compile"},
            s = {"<plug>(vimtex-status)","Status"},
            w = {"<plug>(vimtex-clean)","Wipe (Clean)"},
            e = {"<plug>(vimtex-errors)","Errors"},
        },

        b = {name = "LeetCode Buddy",
            q = {"<cmd>LBQuestions<cr>", "List Questions" },
            l = {"<cmd>LBQuestion<cr>", "View Question" },
            r = {"<cmd>LBReset<cr>", "Reset Code" },
            t = {"<cmd>LBTest<cr>", "Run Code" },
            s = {"<cmd>LBSubmit<cr>", "Submit Code" },
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


