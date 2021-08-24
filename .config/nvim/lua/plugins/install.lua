vim.cmd('autocmd BufWritePost install.lua PackerCompile')

return require('packer').startup({function()
    -- self update
    use { 'wbthomason/packer.nvim', opt=true }
   
    -- look
    use { 'folke/tokyonight.nvim' }

    use {
        'konapun/vacuumline.nvim',
        requires = {
            'glepnir/galaxyline.nvim', branch = 'main',
            'kyazdani42/nvim-web-devicons', opt = true
        },
        config = function()
            require('vacuumline').setup({
                theme = require('vacuumline.theme.nord')
            })
        end
    }

    -- fuzzy finder
    use { 
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim'
        }
    }

    use { 'nvim-telescope/telescope-packer.nvim' }


    -- tree browser
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }
    
    use { 'phaazon/hop.nvim' }

    -- LSP
    use { 'neovim/nvim-lspconfig' }                                     
    
    use { 'kabouzeid/nvim-lspinstall' }
    
    use { 'glepnir/lspsaga.nvim' }
    
    use { 'hrsh7th/nvim-compe' }
   
    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter' }

    use { 'p00f/nvim-ts-rainbow'}

    use { 'glepnir/indent-guides.nvim' }

    use {
        'nvim-treesitter/nvim-treesitter-refactor',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    
    use {
       'romgrk/nvim-treesitter-context',
       requires = 'nvim-treesitter/nvim-treesitter'
    }
    
    use { 'nvim-treesitter/playground' }

    -- dev tools

    use { 'tjdevries/nlua.nvim' }
    
    use  { 'tpope/vim-dispatch' }


end,
config = {
    display = {
        open_fn = require('packer.util').float,
    }
}

})

