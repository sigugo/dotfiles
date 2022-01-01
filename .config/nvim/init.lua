
local api = vim.api
local cfg = vim.fn.stdpath('config')

-- Reload configuration on Buffer write
Flush = function()
    local s = vim.api.nvim_buf_get_name(0)
    if string.match(s, '^' .. cfg .. '*') == nil then
        return
    end
    s = string.sub(s, 6 + string.len(cfg), -5)
    local val = string.gsub(s, '%/', '.')
    package.loaded[val] = nil
end

api.nvim_exec('autocmd BufWrite *.lua,*vim call v:lua.Flush()', false)

require('keybindings')

require('plugins')

require('settings')

