return {
	"williamboman/mason.nvim",
	lazy = false,
	keys = {
		{
			"<leader>M",
			":Mason<CR>",
			mode = "n",
			desc = "Open Mason",
		},
	},
	opts = {
		PATH = "append",
	},
}
