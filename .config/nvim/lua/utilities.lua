local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}

function key_mapper(mode, key, result)
  vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        { noremap = true, silent = true}
    )
end

local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}
function options(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function prerequire(...)
   local status, lib = pcall(require, ...)
   if status then return lib end
   return nil
end

-- function execute(...)
--     vim.api.nvim_command(...)
-- end

