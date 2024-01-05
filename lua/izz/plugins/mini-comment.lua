return {
	{
		"echasnovski/mini.comment",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local minicomment = require("mini.comment")

			minicomment.setup({
				mappings = {
					comment_line = "<leader>cc",
					comment_visual = "<leader>cc",
				},
			})
		end,
	},
}
