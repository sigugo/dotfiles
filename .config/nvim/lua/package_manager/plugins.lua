return require('packer').startup(function()
    
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

    use {                                           -- git file comparison 
        'lewis6991/gitsigns.nvim',
        requires = {
          'nvim-lua/plenary.nvim'
        },
        config = function()
          require('gitsigns').setup()
        end
    }
    use { 'tjdevries/nlua.nvim' }                   -- LUA dev
    
    use 'tpope/vim-dispatch'                        -- asynchronous adapters
    
end)
