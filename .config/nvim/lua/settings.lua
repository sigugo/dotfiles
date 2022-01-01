local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}

function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' and scope ~= 'g' then scopes['o'][key] = value end
end

opt('o', 'updatetime', 400)
opt('o', 'termguicolors', true)
opt('o', 'showmode', true)
opt('o', 'errorbells', false)
opt('o', 'smartcase', true)
opt('b', 'swapfile', false)
opt('o', 'backup', false)
opt('o', 'undodir', vim.fn.stdpath('config') .. '/undodir')
opt('o', 'undofile', true)
opt('o', 'incsearch', true)
opt('o', 'hidden', true)
opt('o', 'completeopt', 'menu,menuone,noselect')

opt('b', 'autoindent', true)
opt('b', 'smartindent', true)
opt('o', 'expandtab', true)
opt('o', 'tabstop', 4)
opt('o', 'softtabstop', 4)
opt('o', 'shiftwidth', 4)

opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'signcolumn', 'yes')
opt('w', 'wrap', true)
opt('o', 'cursorline', true)

-- Tokyo Night Colorscheme settings
opt('g', 'tokyonight_style', 'night')
-- opt('g', 'tokyonight_transparent', true)
-- opt('g', 'tokyonight_hide_inactive_statusline', true)
-- opt('g', 'tokyonight_italic_keywords', true)
-- opt('g', 'tokyonight_italic_comments', true)
-- opt('g', 'tokyonight_italic_variables', false)

vim.cmd('colorscheme tokyonight')
-- vim.cmd('colorscheme kanagawa')
-- vim.cmd('let g:lightline = {"colorscheme" : "tokyonight"}')


vim.cmd('set shortmess+=c')
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

