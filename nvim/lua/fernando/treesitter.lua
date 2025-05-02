local configs = require('nvim-treesitter.configs')
configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "python",
    "lua",
    "latex",
    "yaml",
    "rust",
    "c",
    "cpp",
    "cmake",
    "html",
  },

  -- Install parsers synchronously
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    disable = { "latex" }, -- Disable for latex
    additional_vim_regex_highlighting = { "latex", "markdown" }, -- Additional regex highlighting
  },

  indent = {
    enable = true,
  }
}

require("nvim-treesitter.configs").setup {
    -- Other Treesitter settings
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
}
