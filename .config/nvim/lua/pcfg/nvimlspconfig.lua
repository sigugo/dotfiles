local nvim_lsp = require("lspconfig")
local servers = { "jedi_language_server", "rust_analyzer", "zls", "clangd", "gopls" }
-- local servers = { "jedi_language_server", "rust_analyzer", "zls", "clangd" }

-- global on_attach
local on_attach = function(client, bufnr)
	print("Attaching to " .. client.name)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = true,
		signs = true,
		update_in_insert = false,
	})

	require("lsp_extensions").inlay_hints({
		highlight = "Comment",
		prefix = " > ",
		aligned = false,
		only_current_line = false,
		enabled = {
			"TypeHint",
			"ChainingHint",
			"ParameterHint",
		},
	})

	require("aerial").on_attach(client, bufnr)

	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
	vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
	vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})

	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilites = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp["intelephense"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function(pattern)
		local cwd = vim.loop.cwd()
		local root
		root = nvim_lsp.util.root_pattern("composer.json", ".git")(pattern)
		-- kbox.iml detection to work on the sma
		root = root or nvim_lsp.util.root_pattern("kbox.iml")(pattern)
		-- override root dir detection to have lsp in a dynamic file, be careful not to index the homedir (splosions)
		root = root or nvim_lsp.util.root_pattern("*.php")(pattern)
		-- prefer cwd if root is a descendant
		return nvim_lsp.util.path.is_descendant(cwd, root) and cwd or root
	end,
	settings = {
		stubs = {
			"bcmath",
			"bz2",
			"calendar",
			"Core",
			"curl",
			"zip",
			"zlib",
			"wordpress",
			"woocommerce",
			"acf-pro",
			"wordpress-globals",
			"wp-cli",
			"genesis",
			"polylang",
		},
	},
})

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		settings = {
			["rust_analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "by_self",
				},
				cargo = {
					loadOutDirsFromCheck = true,
				},
				procMacro = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
			["gopls"] = {
				codelenses = { test = true },
				gofumpt = true,
				experimentalPostfixCompletions = true,
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		},
		flags = {
			debounce_text_changes = 200,
		},
	})
end

-- nvim_lsp["gopls"].setup({
-- 	cmd = { "gopls", "--remote=auto" },
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		gopls = {
-- 			experimentalPostfixCompletions = true,
-- 			analyses = {
-- 				unusedparams = true,
-- 				shadow = true,
-- 			},
-- 			staticcheck = true,
-- 		},
-- 	},
-- 	init_options = {
-- 		usePlaceholders = true,
-- 	},
-- })

require("nlua.lsp.nvim").setup(require("lspconfig"), {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})
