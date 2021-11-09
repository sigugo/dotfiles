local nvim_lsp = require('lspconfig')

-- Use an on_attach for a consistent setup experience 
local on_attach = function(client, bufnr)
  print('Attaching to ' .. client.name)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }
  )

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end



local servers = { 'pyright', 'rust_analyzer', 'gopls'}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
        ['rust_analyzer'] = {
           assist = {
               importGranularity = "module",
               importPrefix = "by_self",
           },
           cargo = {
               loadOutDirsFromCheck = true
           },
           procMacro = {
               enable = true
           },
           checkOnSave = {
               command = 'clippy'
           },
        }
     }
  }
end

require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
-- -- Sumneko needs some special attention
-- local system_name
-- if vim.fn.has("mac") == 1 then
--   system_name = "macOS"
-- elseif vim.fn.has("unix") == 1 then
--   system_name = "Linux"
-- elseif vim.fn.has('win32') == 1 then
--   system_name = "Windows"
-- else
--   print("Unsupported system for sumneko")
-- end
-- 
-- 
-- -- Set sumneko install path
-- local sumneko_root_path = '~/build/lua-language-server'
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
-- local runtime_path = vim.split(package.path, ';')
-- 
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- 
-- 
-- require'lspconfig'.sumneko_lua.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
--   settings = {
--       Lua = {
--         runtime = {
--           version = 'LuaJIT',
--           path = runtime_path,
--         },
--         diagnostics = {
--           globals = {'vim'},
--         },
--         workspace = {
--           library = vim.api.nvim_get_runtime_file("", true),
--         },
--         telemetry = {
--           enable = false,
--         },
--       },
--   },
-- }
