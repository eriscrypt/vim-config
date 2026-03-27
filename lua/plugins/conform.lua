return {

	-- Форматирование (замена formatting)
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				-- prettier для JS/TS
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				-- shfmt
				sh = { "shfmt" },
				-- stylua
				lua = { "stylua" },
				-- ruff
				python = { "ruff_format" },
				-- terraform
				terraform = { "terraform_fmt" },
				-- gofumpt
				go = { "gofumpt" },
			},
			format_on_save = {
				timeout_ms = 250,
				lsp_fallback = true,
			},
		},
	},

	-- Линтинг/диагностика (замена diagnostics + code_actions)
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				sh = { "checkmake" }, -- checkmake для Makefile, но для sh подойдет shellcheck если нужно
				-- Добавьте другие по необходимости
			},
		},
		config = function(_, opts)
			local lint = require("lint")
			lint.linters_by_ft = opts.linters_by_ft
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
