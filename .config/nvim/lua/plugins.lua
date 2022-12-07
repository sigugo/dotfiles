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
Plug("nvim-treesitter/nvim-treesitter-context")
-- Plug("nvim-treesitter/nvim-treesitter-textobjects")
-- -- lsp configuration
Plug("neovim/nvim-lspconfig")
Plug("nvim-lua/lsp_extensions.nvim")
Plug("j-hui/fidget.nvim")
-- Plug("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
Plug("simrat39/inlay-hints.nvim")

-- --  show status for code issues
Plug("folke/trouble.nvim")
-- Plug("hrsh7th/cmp-vsnip")

-- -- popup vim.ui.select
Plug("RishabhRD/popfix")
Plug("hood/popui.nvim")

-- -- Comments
Plug("numToStr/Comment.nvim")
Plug("folke/todo-comments.nvim")

-- -- specific languages
-- markdown
-- Plug('plasticboy/vim-markdown')
Plug("SidOfc/mkdx")
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
Plug("windwp/nvim-autopairs")

Plug("L3MON4D3/LuaSnip")
-- Plug("stevearc/vim-vscode-snippets")
Plug("rafamadriz/friendly-snippets")

Plug("hrsh7th/nvim-cmp")

Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lsp-signature-help")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("saadparwaiz1/cmp_luasnip")
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
-- -- Settings
vim.ui.select = require("popui.ui-overrider")
vim.g.neoformat_enabled_yaml = { "prettierd", "prettier" }
-- -- One liners
require("go").setup({

	disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
	-- settings with {}
	go = "go", -- go command, can be go[default] or go1.18beta1
	goimport = "gopls", -- goimport command, can be gopls[default] or goimport
	fillstruct = "gopls", -- can be nil (use fillstruct, slower) and gopls
	gofmt = "gofumpt", --gofmt cmd,
	max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
	tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
	gotests_template = "", -- sets gotests -template parameter (check gotests for details)
	gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
	comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       
	icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
	verbose = false, -- output loginf in messages
	lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
	-- false: do nothing
	-- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
	--   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
	lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
	--      when lsp_cfg is true
	-- if lsp_on_attach is a function: use this function as on_attach function for gopls
	lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
	lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
	-- function(bufnr)
	--    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
	-- end
	-- to setup a table of codelens
	lsp_diag_hdlr = true, -- hook lsp diag handler
	lsp_diag_underline = true,
	-- virtual text setup
	lsp_diag_virtual_text = { space = 0, prefix = "" },
	lsp_diag_signs = true,
	lsp_diag_update_in_insert = false,
	lsp_document_formatting = true,
	-- set to true: use gopls to format
	-- false if you want to use other formatter tool(e.g. efm, nulls)
	lsp_inlay_hints = {
		enable = false,
		-- Only show inlay hints for the current line
		only_current_line = false,
		-- Event which triggers a refersh of the inlay hints.
		-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
		-- not that this may cause higher CPU usage.
		-- This option is only respected when only_current_line and
		-- autoSetHints both are true.
		only_current_line_autocmd = "CursorHold",
		-- whether to show variable name before type hints with the inlay hints or not
		-- default: false
		show_variable_name = true,
		-- prefix for parameter hints
		parameter_hints_prefix = " ",
		show_parameter_hints = true,
		-- prefix for all the other hints (type, chaining)
		other_hints_prefix = "=> ",
		-- whether to align to the lenght of the longest line in the file
		max_len_align = false,
		-- padding from the left if max_len_align is true
		max_len_align_padding = 1,
		-- whether to align to the extreme right or not
		right_align = false,
		-- padding from the right if right_align is true
		right_align_padding = 6,
		-- The color of the hints
		highlight = "Comment",
	},
	gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
	gopls_remote_auto = true, -- add -remote=auto to gopls
	gocoverage_sign = "█",
	sign_priority = 5, -- change to a higher number to override other signs
	dap_debug = true, -- set to false to disable dap
	dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
	-- false: do not use keymap in go/dap.lua.  you must define your own.
	-- windows: use visual studio keymap
	dap_debug_gui = true, -- set to true to enable dap gui, highly recommend
	dap_debug_vt = true, -- set to true to enable dap virtual text
	build_tags = "tag1,tag2", -- set default build tags
	textobjects = true, -- enable default text jobects through treesittter-text-objects
	test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
	verbose_tests = true, -- set to add verbose flag to tests
	run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
	-- float term recommend if you use richgo/ginkgo with terminal color

	trouble = false, -- true: use trouble to open quickfix
	test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
	luasnip = false, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
	--  Do not enable this if you already added the path, that will duplicate the entries
})
require("gitsigns").setup()
require("nvim-web-devicons").setup({})
require("fidget").setup({})
require("which-key").setup({})
require("inlay-hints").setup({
	-- renderer = "inlay-hints/render/dynamic",
	renderer = "inlay-hints/render/eol",

	hints = {
		parameter = {
			show = false,
			highlight = "Comment",
		},
		type = {
			show = true,
			highlight = "Comment",
		},
	},

	only_current_line = false,
	-- eol = {
	-- 	right_align = true,
	-- },
})
require("todo-comments").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})
-- require("lsp_lines").register_lsp_virtual_lines()
-- require("pcfg.lsplines")
-- -- External Scripts
require("pcfg.telescope")
require("pcfg.nvimtreesitter")
require("pcfg.nvimlspconfig")
require("pcfg.nvimcmp")
require("pcfg.nvimlualine")
require("pcfg.rusttools")
require("pcfg.commentnvim")
require("pcfg.nvimcokeline")
require("pcfg.nvimautopairs")
