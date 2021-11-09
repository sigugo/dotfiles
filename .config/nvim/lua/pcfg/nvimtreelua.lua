require'nvim-tree'.setup {
    -- disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = true,
    update_cwd          = true,
    diagnostics         = {
        enable = true
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    view = {
	hide_root_folder = false,
        width = 30,
        height = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        }
    }
}

vim.g.nvim_tree_icons = {
  default= '',
  symlink= '',
  git= {
    unstaged= "✗",
    staged= "✓",
    unmerged= "",
    renamed= "➜",
    untracked= "★",
    deleted= "",
    ignored= "◌"
  },
  folder= {
    default= "",
    open= "",
    empty= "",
    empty_open= "",
    symlink= "",
    symlink_open= "",
  },
  lsp= {
    hint= "",
    info= "",
    warning= "",
    error= "",
  }
}

vim.cmd[[highlight NvimTreeSymlink guifg=blue gui=bold,underline]]
