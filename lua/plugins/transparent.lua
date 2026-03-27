return {
	"xiyaowong/transparent.nvim",
	config = function()
		local transparent = require("transparent")

		transparent.setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLineNr",
				"EndOfBuffer",
				"WinSeparator",
				"CursorLineNr",
				"Folded",
				"FloatBorder",
				"Pmenu",
				"NormalFloat",
			},
			extra_groups = {
				"NvimTreeNormal",
				"BufferLineFill",
				"BufferLineTabClose",
				"LualineBFill",
				"LualineBFill",
				"LualineCFill",
			},
			exclude_groups = {},
		})

		transparent.clear_prefix("NeoTree")
		-- transparent.clear_prefix("BufferLine")
		-- transparent.clear_prefix("lualine")
	end,
}
