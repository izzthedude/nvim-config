return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"regex",
			"bash",
			"dockerfile",
			"json",
			"toml",
			"yaml",
			"meson",
			"python",
			"rust",
			"c",
			"lua",
			"html",
			"css",
			"javascript",
		},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },

		-- Integrate autotag
		autotag = { enable = true },
	},
}
