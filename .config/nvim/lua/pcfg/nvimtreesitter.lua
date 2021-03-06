require'nvim-treesitter.configs'.setup({
  highlight = {
    enable = true,              -- false will disable the whole extension
  },

  indent = {
    enabled = true,
  },

  textobjects = {
    enabled = true
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
  },
})


-- vim.cmd[[set foldmethod=expr]]
-- vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
