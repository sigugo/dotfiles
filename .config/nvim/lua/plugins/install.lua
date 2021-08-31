vim.cmd('autocmd BufWritePost install.lua PackerCompile')
vim.cmd('autocmd BufWritePost install.lua PackerSync')

return require('packer').startup({
    function()
        -- self update
        use { 'wbthomason/packer.nvim', opt=true }

        -- tree browser
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons'
            }
        }
   
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
        
        use { 'yamatsum/nvim-cursorline' }

        -- fuzzy finder
        use { 
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/popup.nvim',
                'nvim-lua/plenary.nvim'
            }
        }

        use { 'nvim-telescope/telescope-packer.nvim' }
        
        use { 'phaazon/hop.nvim' }

        -- LSP
        use { 'neovim/nvim-lspconfig' }                                     
        
        use { 'kabouzeid/nvim-lspinstall' }
        
        use { 'glepnir/lspsaga.nvim' }
        
        use { 'hrsh7th/nvim-compe' }
   
        -- treesitter
        use { 'nvim-treesitter/nvim-treesitter' }

        use { 'p00f/nvim-ts-rainbow'}


        use {
            'nvim-treesitter/nvim-treesitter-refactor',
            requires = 'nvim-treesitter/nvim-treesitter'
        }
        
        use {
           'romgrk/nvim-treesitter-context',
           requires = 'nvim-treesitter/nvim-treesitter'
        }
        
        use { 'nvim-treesitter/playground' }

        -- languag support

        use { 'tjdevries/nlua.nvim' }

        use {
            'simrat39/rust-tools.nvim',
            config = function()
                require('rust-tools').setup({})
            end
        }
        
        -- dev tools
        
        use { 'tpope/vim-dispatch' }
        
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require("indent_blankline").setup {
                    char = "▏",
                    -- space_char =".",
                    show_first_indent_level = false,
                    use_treesitter = true,
                    show_current_context = true,
                    show_end_of_line = true,
                    space_char_blankline = ' ',
                    -- context_patterns = {
                    --     'declaration',
                    --     'expression',
                    --     'pattern',
                    --     'primary_expression',
                    --     'statement',
                    --     'switch_body'
                    -- },
                    filetype_exclude = {
                        'help',
                        'dashboard',
                        'lspinfo',
                        'markdown',
                        'gomod',
                        'xml'
                    },
                    buftype_exclude = {
                        'terminal'
                    }
               }
            end
        }

        -- use {
        --     'blackCauldron7/surround.nvim',
        --     opt = true,
        --     config = function()
        --         require('surround').setup()
        --     end
        -- }

    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})
