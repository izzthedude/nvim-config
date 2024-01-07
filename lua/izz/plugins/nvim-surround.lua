return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	opts = {
		keymaps = {
			insert = "<C-s>s",
			insert_line = "<C-s>S",
			normal = "<leader>Ss",
			normal_cur = "<leader>SS",
			normal_line = "<leader>Sa",
			normal_cur_line = "<leader>SA",
			visual = "<leader>Ss",
			visual_line = "<leader>Sl",
			delete = "<leader>Sd",
			change = "<leader>Sc",
			change_line = "<leader>SC",
		},
	},
}
