return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>F",
				function()
					local api = require("nvim-tree.api")
					if api.tree.is_visible() then
						api.tree.open()
					else
						api.tree.toggle()
					end
				end,
				mode = "n",
				desc = "Open file browser",
			},
		},
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		opts = {
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end

				-- Defaults
				api.config.mappings.default_on_attach(bufnr)

				-- Open file and close tree
				vim.keymap.set("n", "<CR>", function()
					api.node.open.edit()
					api.tree.close()
				end, opts("Open: Close Tree"))
			end,
			view = {
				width = 40,
				relativenumber = true,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		},
	},
}
