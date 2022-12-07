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
