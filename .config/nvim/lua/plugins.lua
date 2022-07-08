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

--[[ Begin vim-plug ]]
local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugins")

--[[ Plugins ]]

--[[ Impatient ]]
Plug("lewis6991/impatient.nvim")

--[[ Color Schemes ]]
Plug("folke/tokyonight.nvim", { ["branch"] = "main" })
Plug("rebelot/kanagawa.nvim")

--[[ DevIcon Support ]]
Plug("kyazdani42/nvim-web-devicons")

--[[ Status Line ]]
Plug("nvim-lualine/lualine.nvim")
Plug("akinsho/bufferline.nvim")

--[[ telescope fuzzy finder with native fzf ]]
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })
Plug("nvim-telescope/telescope-file-browser.nvim")
Plug("nvim-telescope/telescope-ui-select.nvim")

--[[ treesitter highlighting ]]
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-textobjects")

--[[ lsp configuration ]]
Plug("neovim/nvim-lspconfig")
Plug("nvim-lua/lsp_extensions.nvim")
Plug("j-hui/fidget.nvim")

--[[ gitSigns ]]
Plug("lewis6991/gitsigns.nvim")

--[[ show status for code issues ]]
Plug("folke/trouble.nvim")

--[[ popup vim.ui.select ]]
Plug("RishabhRD/popfix")
Plug("hood/popui.nvim")

--[[ Comments ]]
Plug("numToStr/Comment.nvim")

--[[ specific languages ]]
-- .lua
-- Plug("tjdevries/nlua.nvim")
-- .md files
-- Plug("SidOfc/mkdx")
-- Plug("ixru/nvim-markdown")
-- Plug("jakewvincent/mkdnflow.nvim")
-- Plug("plasticboy/vim-markdown")
Plug("joker1007/vim-markdown-quote-syntax")

-- .log files
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

--[[ programing completion, snippets, formatting ... ]]
-- Plug("mhartington/formatter.nvim")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-cmdline")
Plug("saadparwaiz1/cmp_luasnip")
Plug("ray-x/cmp-treesitter")
Plug("rafamadriz/friendly-snippets")
Plug("L3MON4D3/LuaSnip")
Plug("onsails/lspkind-nvim")
Plug("stevearc/aerial.nvim")
Plug("heavenshell/vim-pydocstring", { ["do"] = "make install", ["for"] = "python" })

Plug("numToStr/Comment.nvim")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("sbdchd/neoformat")
Plug("godlygeek/tabular")

--[[ End vim-plug ]]
vim.call("plug#end")

--[[ Impatient Plugin Loading ]]
require("impatient")

--[[ Plugin Configuration Loading ]]
-- -- Config scripts
require("pcfg.nvimtreesitter")
require("pcfg.telescope")
require("pcfg.nvimcmp")
require("pcfg.nvimlspconfig")
require("gitsigns").setup()
require("pcfg.nvimlualine")
require("bufferline").setup({})
require("pcfg.rusttools")
-- -- One-line
require("luasnip.loaders.from_vscode").lazy_load()
require("trouble").setup({})
require("go").setup()
require("aerial").setup({})
require("pcfg.commentnvim")
require("fidget").setup({})
-- -- Settings
vim.ui.select = require("popui.ui-overrider")
vim.g.neoformat_enabled_yaml = { "prettierd", "prettier" }
