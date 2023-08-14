require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "vimdoc",
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

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true,} 
}
