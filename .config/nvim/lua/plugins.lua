local fn = vim.fn
local api = vim.api

-- Ensure that vim-plug is installed
local install_path = fn.stdpath("data") .. "/site/autoload/plug.vim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"curl",
		"-fLo",
		install_path,
		"--create-dirs",
		"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
	})
	api.nvim_exec("source " .. install_path, false)
end

-- Begin vim-plug
local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugins")

-- -- Plugins

-- -- Impatient
Plug("lewis6991/impatient.nvim")

-- -- Colorschemes
Plug("folke/tokyonight.nvim", { ["branch"] = "main" })
Plug("rafamadriz/neon")
Plug("shaeinst/roshnivim-cs")
Plug("tomasiser/vim-code-dark")
Plug("rebelot/kanagawa.nvim")
Plug("bluz71/vim-moonfly-colors")
Plug("marko-cerovac/material.nvim")

-- -- DevIcon Support
Plug("kyazdani42/nvim-web-devicons")

-- -- Status Line
Plug("nvim-lualine/lualine.nvim")
-- Plug("akinsho/bufferline.nvim")
Plug("noib3/nvim-cokeline")

-- Keybinds
Plug("folke/which-key.nvim")

-- -- telescope fuzzy finder with native fzf
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })
Plug("nvim-telescope/telescope-ui-select.nvim")

-- -- gitSigns
Plug("lewis6991/gitsigns.nvim")

-- -- treesitter highlighting
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- -- lsp configuration
Plug("neovim/nvim-lspconfig")
Plug("nvim-lua/lsp_extensions.nvim")
Plug("j-hui/fidget.nvim")
Plug("https://git.sr.ht/~whynothugo/lsp_lines.nvim")

-- --  show status for code issues
Plug("folke/trouble.nvim")

-- -- popup vim.ui.select
Plug("RishabhRD/popfix")
Plug("hood/popui.nvim")

-- -- Comments
Plug("numToStr/Comment.nvim")
-- -- specific languages
-- markdown
-- Plug('plasticboy/vim-markdown')
-- Plug("SidOfc/mkdx")
-- Plug('ixru/nvim-markdown')
-- lua
Plug("tjdevries/nlua.nvim")
-- .log
Plug("mtdl9/vim-log-highlighting")
-- rust
Plug("rust-lang/rust.vim")
Plug("simrat39/rust-tools.nvim")
-- golang
Plug("ray-x/guihua.lua")
Plug("ray-x/go.nvim")
Plug("mfussenegger/nvim-dap")
Plug("mfussenegger/nvim-dap-ui")
Plug("theHamsta/nvim-dap-virtual-text")
-- Plug('zchee/nvim-go', { ['do'] = 'make' })
-- python
Plug("pixelneo/vim-python-docstring")

-- -- programing completion, snippets, formatting ...
Plug("lukas-reineke/indent-blankline.nvim")
Plug("sbdchd/neoformat")
-- Plug("mhartington/formatter.nvim")

-- Plug("hrsh7th/vim-vsnip")
-- Plug("hrsh7th/vim-vsnip-integ")
Plug("L3MON4D3/LuaSnip")
Plug("stevearc/vim-vscode-snippets")
-- Plug("rafamadriz/friendly-snippets")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("saadparwaiz1/cmp_luasnip")
-- Plug("hrsh7th/cmp-vsnip")
Plug("lukas-reineke/cmp-rg")

Plug("onsails/lspkind-nvim")
Plug("mortepau/codicons.nvim")

Plug("stevearc/aerial.nvim")

-- -- Tabular formatting
Plug("godlygeek/tabular")

-- End vim-plug
vim.call("plug#end")

-- Impatient Plugin Loading
require("impatient")

-- Plugin Configurations
-- -- One liners
vim.ui.select = require("popui.ui-overrider")
require("go").setup()
require("gitsigns").setup()
require("fidget").setup({})
require("lsp_lines").register_lsp_virtual_lines()
require("which-key").setup({})
-- require("pcfg.lsplines")
-- -- External Scripts
require("pcfg.telescope")
require("pcfg.nvimtreesitter")
require("pcfg.nvimlspconfig")
require("pcfg.nvimcmp")
require("pcfg.formatternvim")
require("pcfg.nvimlualine")
require("pcfg.rusttools")
require("pcfg.commentnvim")
require("pcfg.nvimcokeline")
-- require("bufferline").setup({})
