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
options('o', 'completeopt', 'menuone,noinsert,noselect')

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

-- vim.g.mapleader = ' '
