local vo=vim.o
local vbo=vim.bo
local vgo=vim.go
local vwo=vim.wo


vo.updatetime = 400
vo.termguicolors = true
vo.showmode = true
vo.errorbells = false
vo.smartcase = true
vbo.swapfile = false
vo.backup = false
vo.undodir = vim.fn.stdpath('config') .. '/undodir'
vo.undofile = true
vo.incsearch = true
vo.hidden = true
vo.completeopt = 'menuone,noinsert,noselect'

vbo.autoindent = true
vbo.smartindent = true
vo.expandtab = true
vo.tabstop = 4
vo.softtabstop = 4
vo.shiftwidth = 4

vwo.number = true
vwo.relativenumber = true
vwo.signcolumn = 'yes'
vwo.wrap = true

vim.g.mapleader = ' '
