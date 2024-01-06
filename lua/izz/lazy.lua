local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

vim.keymap.set("n", "<leader>L", require("lazy.view").show, { desc = "Open Lazy" })
-- Prompt to load plugin
vim.keymap.set("n", "<leader>ll", function()
	vim.ui.select(lazy_unloaded_plugins(), {
		prompt = "Select plugin to load",
	}, function(choice)
		if choice then
			vim.cmd(string.format("Lazy load %s", choice))
			print(string.format("Successfully loaded %s", choice))
		end
	end)
end, { desc = "Load plugin" })
-- Prompt to reload plugin
vim.keymap.set("n", "<leader>lr", function()
	vim.ui.select(lazy_plugins(), {
		prompt = "Select plugin to reload",
	}, function(choice)
		if choice then
			vim.cmd(string.format("Lazy reload %s", choice))
			print(string.format("Successfully reloaded %s", choice))
		end
	end)
end, { desc = "Reload plugin" })

lazy.setup({
	{ import = "izz.plugins" },
})
