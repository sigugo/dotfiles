require'utilities'

local function setup_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }
  )
end

local lspconfig = require'lspconfig'
local completion = require'completion'

local on_attach = function(client, bufnr)
    
    print('Attaching to ' .. client.name)
    setup_diagnostics()
    
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') 
    
    require('completion').on_attach()
    completion.on_attach(client)

end

vim.g.completion_matching_strategy_list = {'substring', 'exact', 'fuzzy', 'all'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  {complete_items = {'lsp', 'snippet'}},
  {mode = '<c-p>'},
  {mode = '<c-n>'},
}

require('nlua.lsp.nvim').setup(require('lspconfig'), {
  on_attach = on_attach,
})

lspconfig.gopls.setup{ on_attach=require'completion'.on_attach }
lspconfig.pyright.setup{ on_attach=require'completion'.on_attach }

