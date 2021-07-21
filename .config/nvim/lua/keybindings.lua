require'utilities'

vim.g.mapleader = ' '

-- SYS clipboard
key_mapper('n', '<leader>y', '"+yy')
key_mapper('v', '<leader>y', '"+y')
key_mapper('n', '<leader>p', '"+p')
key_mapper('v', '<leader>p', '"+p')

-- LSP
key_mapper('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
key_mapper('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
key_mapper('n', '<leader>ds', ':Lspsaga show_line_diagnostics <CR>')
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>zz')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<leader>ca', ':Lspsaga code_action<CR>')
key_mapper('n', '<leader>rn', ':Lspsaga rename<CR>')

-- Telescope
key_mapper('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
key_mapper('n', '<leader>gf', ':lua require"telescope.builtin".git_files()<CR>')
key_mapper('n', '<leader>gs', ':lua require"telescope.builtin".git_status()<CR>')
key_mapper('n', '<leader>fp', ':lua require("telescope").extensions.packer.plugins(opts)<CR>')
