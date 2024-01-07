return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>G",
			function()
				require("neogit").open({ kind = "vsplit" })
			end,
			mode = "n",
			desc = "Open Neogit",
		},
	},
	config = true,
}
