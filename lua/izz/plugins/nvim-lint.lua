return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>cl",
			function()
				require("lint").try_lint()
			end,
			mode = "n",
			desc = "Lint buffer",
		},
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff", "mypy" },
		}
		lint.linters.ruff.cmd = venv_bin_func("ruff")
		lint.linters.mypy.cmd = venv_bin_func("mypy")

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
