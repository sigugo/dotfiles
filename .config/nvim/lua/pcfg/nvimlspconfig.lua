local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

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
    }
  }
end


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
