local fn = vim.fn
local api = vim.api

-- Ensure that vim-plug is installed
local install_path = fn.stdpath('data')..'/site/autoload/plug.vim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'curl', '-fLo', install_path, '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
    api.nvim_exec('source ' .. install_path, false)
end

-- Begin vim-plug
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugins')

-- -- Plugins

-- -- Tokyo Night color scheme
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
-- Plug('ghifarit53/tokyonight-vim', { ['branch'] = 'main' })

-- -- DevIcon Support
Plug('kyazdani42/nvim-web-devicons')

-- -- Status Line
Plug('nvim-lualine/lualine.nvim')

-- -- nvim-tree
Plug('kyazdani42/nvim-tree.lua')

-- -- telescope fuzzy finder with native fzf 
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- -- treesitter highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- -- lsp configuration
Plug('neovim/nvim-lspconfig')

-- --  show status for code issues
Plug('folke/trouble.nvim')

-- -- specific languages
Plug('tjdevries/nlua.nvim')
-- Plug('zchee/nvim-go', { ['do'] = 'make' })

-- -- programing completion and snippets
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

-- End vim-plug
vim.call('plug#end')

-- Plugin Configurations
require('pcfg.nvimtreesitter')
require('pcfg.nvimtreelua')
require('pcfg.telescope')
require('pcfg.nvimcmp')
require('pcfg.nvimlspconfig')
require('pcfg.nvimlualine')
