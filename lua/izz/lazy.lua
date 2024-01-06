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

vim.keymap.set("n", "<leader>L", require("lazy.view").show, { desc = "Open Lazy" })
vim.keymap.set("n", "<leader>lp", function()
	vim.ui.select(lazy_unloaded_plugins(), {
		prompt = "Select plugin to load",
	}, function(choice)
		if choice then
			vim.cmd(string.format("Lazy load %s", choice))
			print(string.format("Successfully loaded %s", choice))
		end
	end)
end, { desc = "Load plugin" })

require("lazy").setup({
	{ import = "izz.plugins" },
})
