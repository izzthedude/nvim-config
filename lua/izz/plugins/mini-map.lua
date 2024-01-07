return {
	"echasnovski/mini.map",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local minimap = require("mini.map")

		minimap.setup({
			integrations = {
				minimap.gen_integration.builtin_search(),
				minimap.gen_integration.gitsigns(),
				minimap.gen_integration.diagnostic(),
			},
			window = {
				show_integration_count = false,
				width = 3,
			},
		})
		minimap.open()
	end,
}
