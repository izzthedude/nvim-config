function cwd()
	return vim.loop.fs_realpath(".")
end

function path_join(...)
	local paths = {}
	for _, path in ipairs({ ... }) do
		table.insert(paths, path)
	end
	return table.concat(paths, "/")
end

function venv_path(path)
	path = path or cwd()

	-- Default to activated venv.
	local venv = vim.env.VIRTUAL_ENV or nil

	-- Find and use virtualenv in current directory.
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(path_join(path, pattern, "pyvenv.cfg"))
		if match ~= "" then
			venv = vim.fs.dirname(match)
		end
	end

	return vim.fs.normalize(venv)
end

function venv_bin(executable)
	local exec = vim.fn.exepath(executable) or executable
	local venv = venv_path()
	if venv then
		exec = path_join(venv, "bin", executable)
	end
	return exec
end

function venv_bin_func(executable)
	local function inner()
		return venv_bin(executable)
	end
	return inner
end

-- Helper function to grab local venv python first
-- Reference: https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-851247107
function python_path()
	-- Default to system Python.
	local exepath = vim.fn.exepath
	local python = exepath("python3") or exepath("python") or "python"

	-- Use activated virtualenv if available.
	local venv = venv_path()
	if venv then
		python = path_join(venv, "bin", "python")
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
