return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			local mason = require("mason")

			vim.keymap.set("n", "<leader>M", ":Mason<CR>")

			mason.setup({
				PATH = "append",
			})
		end,
	},
}
