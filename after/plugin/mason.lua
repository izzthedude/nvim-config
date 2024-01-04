local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local mason = require('mason')
local ms_lspconfig = require('mason-lspconfig')
local ms_registry = require("mason-registry")


vim.keymap.set("n", "<leader>M", ":Mason<CR>")

mason.setup({})

-- Hook when a package is successfully installed
ms_registry:on(
    "package:install:success",
    vim.schedule_wrap(function (pkg, handle)
        -- Install stuff when pylsp is installed
        if pkg.name == "python-lsp-server" then
            local pip_path = string.format("%s/venv/bin/pip", pkg:get_install_path())
            vim.fn.system({
               pip_path,
               "install",
               "python-lsp-ruff",
               "python-lsp-black",
               "pylsp-mypy",
            })
        end
    end)
)

-- Helper function for creating handlers
local function create_handler(server, opts)
    local function handler()
        server.setup(opts)
    end
    return handler
end

ms_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = create_handler(
            lspconfig.lua_ls,
            lsp_zero.nvim_lua_ls()
        ),
    },
})

