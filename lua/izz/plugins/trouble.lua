return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>T",
				function()
					require("trouble").toggle()
				end,
				mode = "n",
				desc = "Toggle Trouble",
			},
			{
				"gL",
				function()
					require("trouble").toggle("workspace_diagnostics")
				end,
				mode = "n",
				desc = "Show workspace diagnostics",
			},
			{
				"gl",
				function()
					require("trouble").toggle("document_diagnostics")
				end,
				mode = "n",
				desc = "Show buffer diagnostics",
			},
			{
				"gd",
				function()
					require("trouble").toggle("lsp_definitions")
				end,
				mode = "n",
				desc = "Show LSP definitions",
			},
			{
				"gt",
				function()
					require("trouble").toggle("lsp_type_definitions")
				end,
				mode = "n",
				desc = "Show LSP type definitions",
			},
			{
				"gi",
				function()
					require("trouble").toggle("lsp_implementations")
				end,
				mode = "n",
				desc = "Show LSP implementations",
			},
			{
				"gr",
				function()
					require("trouble").toggle("lsp_references")
				end,
				mode = "n",
				desc = "Show LSP references",
			},
		},
		opts = {
			height = 15,
			action_keys = {
				jump = { "o" },
				jump_close = { "<CR>" },
				preview = { "<Tab>" },
			},
			auto_preview = false,
		},
	},
}
