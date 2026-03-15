return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local transparent = true

		local set_theme = function(t)
			require("tokyonight").setup({
				style = "moon",
				transparent = t,
			})
			vim.cmd.colorscheme("tokyonight")

			if t then
				vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
				vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })
			end
		end

		local toggle_transparency = function()
			transparent = not transparent
			set_theme(transparent)
		end

		set_theme(transparent)

		vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
	end,
}
