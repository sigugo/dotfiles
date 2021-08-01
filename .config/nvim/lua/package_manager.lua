local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute('packadd packer.nvim')
end

-- for opt mode
vim.cmd [[packadd packer.nvim]]

-- compile when changing this file
vim.cmd 'autocmd BufWritePost package_manager.lua PackerCompile'


-- startup
return require('packer').startup(function()
    
    -- plugins
    
    use { 'wbthomason/packer.nvim', opt=true }      -- self manage
    
    use { 'folke/tokyonight.nvim' }                 -- color scheme
    
    use {                                           -- Telescope fuzzy file finder
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use { 'nvim-telescope/telescope-packer.nvim' }  -- Telescope packer integration

    use {                                           --  tree file viewer
        'kyazdani42/nvim-tree.lua',
        requires = {{'kyazdani42/nvim-web-devicons'}}
    }

    use { 'phaazon/hop.nvim' }                      -- hop easy motion

    use { 'neovim/nvim-lspconfig' }                 -- LSP config
    use { 'kabouzeid/nvim-lspinstall' }             -- LSP install
    use { 'nvim-treesitter/nvim-treesitter'}        -- treesitter language engine
    use { 'glepnir/lspsaga.nvim' }                  -- Lighetweight LSP plugin
    use { 'nvim-lua/completion-nvim'}               -- auto-completion
    use { 'p00f/nvim-ts-rainbow'}                   -- rainbow brackets
    use { 'glepnir/indent-guides.nvim' }            -- indent guides
    -- use { 'norcalli/snippets.nvim' }                -- code snippets


    use { 'tjdevries/nlua.nvim' }                   -- LUA dev
    
    use 'tpope/vim-dispatch'                        -- asynchronous adapters
    -- use 'tpope/vim-fugitive'                        -- git integration
    
end)
