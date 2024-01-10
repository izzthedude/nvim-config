return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader><Tab>",
			function()
				local tl_config = require("telescope.config").values

				local file_paths = {}
				for _, item in ipairs(require("harpoon"):list().items) do
					table.insert(file_paths, 1, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = tl_config.file_previewer({}),
						sorter = tl_config.generic_sorter({}),
					})
					:find()
			end,
			mode = "n",
			desc = "Open Harpoon",
		},
		{
			"<leader>H",
			function()
				require("harpoon"):list():append()
			end,
			mode = "n",
			desc = "Append current buffer to Harpoon",
		},
	},
}
