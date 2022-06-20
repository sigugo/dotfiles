local cmp = require("cmp")
local snippet = require("luasnip")
local lspkind = require("lspkind")

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({

	snippet = {
		expand = function(args)
			snippet.lsp_expand(args.body)
		end,
	},

	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),

		["<C-k>"] = cmp.mapping(function(fallback)
			if snippet.jumpable(-1) then
				snippet.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-l>"] = cmp.mapping(function(fallback)
			if snippet.jumpable(1) then
				snippet.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip", option = { use_show_condition = true } },
		{ name = "treesitter", keyword_length = 6, max_item_count = 5 },
		{ name = "rg", keyword_length = 6, max_item_count = 5 },
		{ name = "buffer", keyword_length = 5, max_item_count = 5 },
	}),

	experimental = {
		native_menu = false,
		ghost_text = true,
	},

	formatting = {
		format = lspkind.cmp_format({
			-- with_text = true, -- do not show text alongside icons
			mode = "symbol_text",
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				snippet = "[snip]",
				rg = "[grep]",
				gh_issues = "[issues]",
				treesitter = "[tsit]",
			},
			-- preset = "codicons",
			maxwidth = 50,
			before = function(entry, vim_item)
				-- other stuff
				return vim_item
			end,
		}),
	},
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
