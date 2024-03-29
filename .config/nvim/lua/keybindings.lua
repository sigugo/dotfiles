-- Set the leader first
vim.g.mapleader = " "

-- function for most keymaps
local function kmap(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- Buffers
kmap("", "<leader>bt", "<Plug>(cokeline-focus-next)")
kmap("", "<leader>bT", "<Plug>(cokeline-focus-prev)")
kmap("n", "<Tab>", "<Plug>(cokeline-focus-next)")
kmap("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)")

kmap("", "<leader>bn1", "<Plug>(cokeline-focus-1)")
kmap("", "<leader>bn2", "<Plug>(cokeline-focus-2)")
kmap("", "<leader>bn3", "<Plug>(cokeline-focus-3)")
kmap("", "<leader>bn4", "<Plug>(cokeline-focus-4)")
kmap("", "<leader>bn5", "<Plug>(cokeline-focus-5)")

kmap("", "<leader>bm1", "<Plug>(cokeline-switch-1)")
kmap("", "<leader>bm2", "<Plug>(cokeline-switch-2)")
kmap("", "<leader>bm3", "<Plug>(cokeline-switch-3)")
kmap("", "<leader>bm4", "<Plug>(cokeline-switch-4)")
kmap("", "<leader>bm5", "<Plug>(cokeline-switch-5)")

kmap("", "<leader>bd", ":bd<CR>")
kmap("", "<leader>bq", ":bd!<CR>")

-- Quick escapes
-- kmap('i', 'jk', '<ESC>')
-- kmap('i', 'JK', '<ESC>')
-- kmap('i', 'jK', '<ESC>')
-- kmap('i', 'Jk', '<ESC>')

-- Interact with the OS Clipboard
kmap("n", "<leader>y", '"+yy')
kmap("v", "<leader>y", '"+y')
kmap("n", "<leader>p", '"+p')
kmap("v", "<leader>p", '"+p')

-- LSP
kmap("n", "<leader>ldn", ":lua vim.diagnostic.goto_next()<CR>")
kmap("n", "<leader>ldp", ":lua vim.diagnostic.goto_prev()<CR>")
kmap("n", "<leader>lds", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
kmap("n", "<leader>lgd", ":lua vim.lsp.buf.definition()<CR>zz")
kmap("n", "<leader>lgD", ":lua vim.lsp.buf.declaration()<CR>")
kmap("n", "<leader>lgi", ":lua vim.lsp.buf.implementation()<CR>")
kmap("n", "<leader>lgw", ":lua vim.lsp.buf.document_symbol()<CR>")
kmap("n", "<leader>lgW", ":lua vim.lsp.buf.workspace_symbol()<CR>")
kmap("n", "<leader>lgr", ":lua vim.lsp.buf.references()<CR>")
kmap("n", "<leader>lgt", ":lua vim.lsp.buf.type_definition()<CR>")
kmap("n", "<leader>lk", ":lua vim.lsp.buf.hover()<CR>")
kmap("n", "<leader>lrn", ":lua vim.lsp.buf.rename()<CR>")
kmap("n", "<leader>lca", ":lua vim.lsp.buf.code_action()<CR>")
kmap("n", "<c-k>", ":lua vim.lsp.buf.signature_help()<CR>")

-- Format
kmap("n", "<leader>ft", ":Neoformat<CR>")

-- Plugins

-- -- Telescope
kmap("n", "<C-p>", ':lua require"telescope.builtin".find_files()<CR>')
kmap("n", "<leader>ff", ':lua require"telescope.builtin".find_files()<CR>')
kmap("n", "<leader>fg", ':lua require"telescope.builtin".live_grep()<CR>')
kmap("n", "<leader>fd", ':TodoTelescope keywords=TODO,FIX <CR>')

-- -- Vim Vsnip
kmap("i", "<C-j>", ':lua require"telescope.builtin".find_files()<CR>')
kmap("s", "<C-j>", ':lua require"telescope.builtin".find_files()<CR>')

-- -- Troubles
kmap("", "<leader>tt", ":TroubleToggle<CR>")
kmap("", "<leader>td", ':TodoQuickFix<CR>')

-- -- Nvim-Tree
-- kmap('', '<leader>rr', ':NvimTreeToggle<CR>')

-- -- Gitsigns
kmap("", "<leader>gsb", ":Gitsigns blame_line<CR>")
kmap("", "<leader>gst", ":Gitsigns toggle_signs<CR>")
kmap("", "<leader>gsp", ":Gitsigns preview_hunk<CR>")
kmap("", "<leader>gsi", ":Gitsigns next_hunk<CR>")
kmap("", "<leader>gso", ":Gitsigns prev_hunk<CR>")
kmap("", "<leader>gu", ":Gitsigns reset_hunk<CR>")
