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

		lsp_zero.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }

			lsp_zero.default_keymaps(opts)

			opts.desc = "Show documentation of symbol under the cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			-- Handled by trouble.nvim
			-- opts.desc = "Show LSP definitions"
			-- vim.keymap.set("n", "gd", ts_builtin.lsp_definitions, opts)

			-- opts.desc = "Show LSP implementations"
			-- vim.keymap.set("n", "gi", ts_builtin.lsp_implementations, opts)
			--
			-- opts.desc = "Show LSP type definitions"
			-- vim.keymap.set("n", "gt", ts_builtin.lsp_type_definitions, opts)
			--
			-- opts.desc = "Show LSP references"
			-- vim.keymap.set("n", "gr", ts_builtin.lsp_references, opts)

			-- opts.desc = "Show line diagnostics"
			-- vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			--
			-- opts.desc = "Show buffer diagnostics"
			-- vim.keymap.set("n", "gL", function()
			-- 	ts_builtin.diagnostics({ bufnr = 0 })
			-- end, opts)

			opts.desc = "Show LSP signature information"
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end)

		-- Helper function for creating handlers for mason_lspconfig
		local function create_handler(server, opts)
			local function handler()
				server.setup(opts)
			end
			return handler
		end

		-- Mason lspconfig
		ms_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
			},
			handlers = {
				lsp_zero.default_setup,
				lua_ls = create_handler(lspconfig.lua_ls, lsp_zero.nvim_lua_ls()),
				pyright = create_handler(lspconfig.pyright, {
					-- Make pyright use local venv if available
					on_init = function(client)
						client.config.settings.python.pythonPath = venv_bin("python")
					end,
				}),
			},
		})
	end,
}
