require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "help",
                         "bash",
                         "python",
                         "lua",
                         "latex",
                         "yaml",
                         "rust",
                         -- "c",
                         -- "cpp",
                         -- "cmake"
                       },

  -- Install parsers synchronously
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` 
  -- CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "latex", "markdown" },
    -- additional_vim_regex_highlighting = false,
  },

  indent = { enable = true,}
}
