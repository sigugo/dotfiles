local nvim_lsp = require("lspconfig")
local inlay_hints = require("inlay-hints")

-- local servers = { "jedi_language_server", "rust_analyzer", "intelephense", "gopls", "sumneko_lua" }
local servers = {
	"jedi_language_server",
	"rust_analyzer",
	"zls",
	"gopls",
	"sumneko_lua",
	"yamlls",
	"ansiblels",
	"marksman",
}

-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use an on_attach for a consistent setup experience
local on_attach = function(client, bufnr)
	print("Attaching to " .. client.name)
	inlay_hints.on_attach(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = true, -- disabled for virtual_lines
		virtual_lines = false,
		-- virtual_lines = { true, prefix = "🔥" },
		-- virtual_lines = { true, prefix = "↓" },
		-- virtual_lines = { true, prefix = "↓🪲" },
		signs = true,
		update_in_insert = false,
	})

	-- require("lsp_extensions").inlay_hints({
	-- 	highlight = "Comment",
	-- 	prefix = " > ",
	-- 	aligned = false,
	-- 	only_current_line = false,
	-- 	enabled = {
	-- 		"TypeHint",
	-- 		"ChainingHint",
	-- 		"ParameterHint",
	-- 	},
	-- })

	-- Enable completion triggered by <c-x><c-o>
	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

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

-- nvim_lsp["gopls"].setup({
--         on_attach = on_attach,
--         capabilities = capabilities,
--         root_dir = function(pattern)
--                 local cwd = vim.loop.cwd()
--                 local root
--         root = nvim_lsp.util.root_pattern 'go.work'(pattern) or nvim_lsp.util.root_pattern('go.mod', '.git')(pattern)
--         -- override root dir detection to have lsp in a dynamic file, be careful not to index the homedir (splosions)
--                 root = root or nvim_lsp.util.root_pattern("*.go")(pattern)
--                 -- prefer cwd if root is a descendant
--                 return nvim_lsp.util.path.is_descendant(cwd, root) and cwd or root
--         end,
-- })

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
		settings = {
			rust_analyzer = {
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
			Lua = {
				hint = {
					enable = true,
				},
				diagnostics = {
					globals = { "vim" },
				},
			},
			gopls = {
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
			golangci_lint_ls = {
				filetypes = { "go", "gomod" },
			},
			javascript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
		},
	})
end

-- require("nlua.lsp.nvim").setup(require("lspconfig"), {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	flags = {
-- 		debounce_text_changes = 150,
-- 	},
-- })
