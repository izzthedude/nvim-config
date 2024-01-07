return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({
						timeout_ms = 500,
						lsp_fallback = true,
					})
				end,
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {
				ruff_fix = {
					command = venv_bin_func("ruff"),
				},
				ruff_format = {
					command = venv_bin_func("ruff"),
				},
			},
		},
	},
}
