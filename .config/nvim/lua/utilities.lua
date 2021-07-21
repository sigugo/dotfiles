local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function key_mapper(mode, key, result)
  vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        { noremap = true, silent = true}
    )
end

function options(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end
