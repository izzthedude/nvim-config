return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()

		local lspconfig = require("lspconfig")
		local ms_lspconfig = require("mason-lspconfig")
		local ts_builtin = require("telescope.builtin")

		lsp_zero.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }

			lsp_zero.default_keymaps(opts)

			opts.desc = "Show documentation of symbol under the cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", ts_builtin.lsp_definitions, opts)

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", ts_builtin.lsp_implementations, opts)

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", ts_builtin.lsp_type_definitions, opts)

			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gr", ts_builtin.lsp_references, opts)

			opts.desc = "Show LSP signature information"
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "gL", function()
				ts_builtin.diagnostics({ bufnr = 0 })
			end, opts)

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end)

		lsp_zero.setup_servers({ "lua_ls", "pyright" })

		-- Mason lspconfig
		ms_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
			},
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
				end,
				-- Make pyright use the local venv first
				pyright = function()
					lspconfig.pyright.setup({
						on_init = function(client)
							local config = client.config
							local python = python_path(config.root_dir)
							config.settings.python.pythonPath = python
						end,
						settings = {
							python = {
								analysis = {
									-- Use mypy for type checking
									typeCheckingMode = "off",
								},
							},
						},
					})
				end,
			},
		})
	end,
}
