-- Helper function to grab local venv python first
-- Reference: https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-851247107
function python_path(workspace)
	local path = require("lspconfig/util").path
	local exepath = vim.fn.exepath

	-- Default to system Python.
	local python = exepath("python3") or exepath("python") or "python"

	-- Use activated virtualenv if available.
	if vim.env.VIRTUAL_ENV then
		python = path.join(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Find and use virtualenv in workspace directory.
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
		if match ~= "" then
			python = path.join(path.dirname(match), "bin", "python")
		end
	end

	return python
end

function lazy_plugins()
	-- Helper function for plugins' names
	local plugins = {}
	for _, plugin in ipairs(require("lazy").plugins()) do
		table.insert(plugins, plugin.name)
	end
	table.sort(plugins)
	return plugins
end

function lazy_unloaded_plugins()
	-- Helper function for unloaded plugins' names
	local plugins = {}
	for _, plugin in ipairs(require("lazy").plugins()) do
		if not plugin._.loaded then
			table.insert(plugins, plugin.name)
		end
	end
	table.sort(plugins)
	return plugins
end
