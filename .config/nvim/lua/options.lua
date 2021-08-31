require'utilities'

options('o', 'updatetime', 400)
options('o', 'termguicolors', true)
options('o', 'showmode', true)
options('o', 'errorbells', false)
options('o', 'smartcase', true)
options('b', 'swapfile', false)
options('o', 'backup', false)
options('o', 'undodir', vim.fn.stdpath('config') .. '/undodir')
options('o', 'undofile', true)
options('o', 'incsearch', true)
options('o', 'hidden', true)
options('o', 'completeopt', 'menuone,noselect')

options('b', 'autoindent', true)
options('b', 'smartindent', true)
options('o', 'expandtab', true)
options('o', 'tabstop', 4)
options('o', 'softtabstop', 4)
options('o', 'shiftwidth', 4)

options('w', 'number', true)
options('w', 'relativenumber', true)
options('w', 'signcolumn', 'yes')
options('w', 'wrap', true)
options('o', 'cursorline', true)

vim.cmd [[set shortmess+=c]]
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- nvim-tree
vim.g.nvim_tree_width = 35
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_hide_dotfiles = 0

vim.g.nvim_tree_lint_lsp = 1
vim.g.nvim_tree_lsp_diagnostics = 1

vim.g.nvim_tree_side = 'left'

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
