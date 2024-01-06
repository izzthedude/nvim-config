return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		keys = {
			{
				"<leader>sf",
				require("telescope.builtin").find_files,
				mode = "n",
				desc = "Search files",
			},
			{
				"<leader>ss",
				require("telescope.builtin").live_grep,
				mode = "n",
				desc = "Search string",
			},
		},
	},
}
