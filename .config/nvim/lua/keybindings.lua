-- Set the leader first
vim.g.mapleader = " "

-- function for most keymaps
local function kmap(mode, key, result)
  vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        { noremap = true, silent = true}
    )
end


-- Buffers
kmap('', '<leader>bp', ':bprev<CR>')
kmap('', '<leader>bn', ':bnext<CR>')
kmap('', '<leader>bd', ':bd<CR>')
kmap('', '<leader>bq', ':bd!<CR>')

-- Quick escapes
kmap('i', 'jk', '<ESC>')
kmap('i', 'JK', '<ESC>')
kmap('i', 'jK', '<ESC>')
kmap('i', 'Jk', '<ESC>')

-- Interact with the OS Clipboard
kmap('n', '<leader>y', '"+yy')
kmap('v', '<leader>y', '"+y')
kmap('n', '<leader>p', '"+p')
kmap('v', '<leader>p', '"+p')

-- LSP
kmap('n', '<leader>ldn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
kmap('n', '<leader>ldp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
-- kmap('n', '<leader>lds', ':Lspsaga show_line_diagnostics <CR>')
kmap('n', '<leader>lgd', ':lua vim.lsp.buf.definition()<CR>zz')
kmap('n', '<leader>lgD', ':lua vim.lsp.buf.declaration()<CR>')
kmap('n', '<leader>lgi', ':lua vim.lsp.buf.implementation()<CR>')
kmap('n', '<leader>lgw', ':lua vim.lsp.buf.document_symbol()<CR>')
kmap('n', '<leader>lgW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
kmap('n', '<leader>lgr', ':lua vim.lsp.buf.references()<CR>')
kmap('n', '<leader>lgt', ':lua vim.lsp.buf.type_definition()<CR>')
kmap('n', '<leader>lk', ':lua vim.lsp.buf.hover()<CR>')
kmap('n', '<leader>lrn', ':lua vim.lsp.buf.rename()<CR>')
-- kmap('n', '<leader>lrn', ':lua require"lspsaga.rename".rename()<CR>')
kmap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
kmap('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>')
-- kmap('n', '<leader>lca', ':Lspsaga code_action<CR>')


-- Plugins

-- -- Telescope
kmap('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
kmap('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>')
kmap('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>')
kmap('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>')

-- -- Nvim-Tree
kmap('', '<leader>tt', ':NvimTreeToggle<CR>')

-- -- Gitsigns
kmap('', '<leader>gb', ':Gitsigns blame_line<CR>')
kmap('', '<leader>gt', ':Gitsigns toggle_signs<CR>')
kmap('', '<leader>gp', ':Gitsigns preview_hunk<CR>')
kmap('', '<leader>gi', ':Gitsigns next_hunk<CR>')
kmap('', '<leader>go', ':Gitsigns prev_hunk<CR>')
kmap('', '<leader>gu', ':Gitsigns reset_hunk<CR>')