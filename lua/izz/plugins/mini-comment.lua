return {
	"echasnovski/mini.comment",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		mappings = {
			comment_line = "<leader>cc",
			comment_visual = "<leader>cc",
		},
	},
}
