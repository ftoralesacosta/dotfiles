require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "help",
                         "bash",
                         "python",
                         "lua",
                         "latex",
                         "yaml",
                         "rust",
                         "c",
                         "cpp",
                         "cmake"
                       },

  -- Install parsers synchronously
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = { "latex", "markdown" },
  },
  indent = { enable = true,}
}
