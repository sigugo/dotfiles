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

-- -- Impatient
Plug('lewis6991/impatient.nvim')

-- -- Color Schemes
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug('rebelot/kanagawa.nvim')

-- -- DevIcon Support
Plug('kyazdani42/nvim-web-devicons')

-- -- Status Line
Plug('nvim-lualine/lualine.nvim')
Plug('akinsho/bufferline.nvim')

-- -- telescope fuzzy finder with native fzf 
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- -- gitSigns
Plug('lewis6991/gitsigns.nvim')

-- -- treesitter highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- -- lsp configuration
Plug('neovim/nvim-lspconfig')
Plug('nvim-lua/lsp_extensions.nvim')

-- --  show status for code issues
Plug('folke/trouble.nvim')

-- -- specific languages
Plug('tjdevries/nlua.nvim')
Plug('plasticboy/vim-markdown')
-- Plug('zchee/nvim-go', { ['do'] = 'make' })

-- -- programing completion, snippets, formatting ...
Plug('lukas-reineke/indent-blankline.nvim')
Plug('sbdchd/neoformat')
Plug('mhartington/formatter.nvim')

Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/vim-vsnip-integ')

Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-vsnip')

-- End vim-plug
vim.call('plug#end')

-- Impatient Plugin Loading
require('impatient')

-- Plugin Configurations
require('pcfg.nvimtreesitter')
require('pcfg.telescope')
require('pcfg.nvimcmp')
require('pcfg.nvimlspconfig')
require('gitsigns').setup()
require('pcfg.formatternvim')
require('pcfg.nvimlualine')
require("bufferline").setup{}
