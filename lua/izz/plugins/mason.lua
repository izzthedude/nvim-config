return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function ()
            local mason = require('mason')
            local ms_registry = require("mason-registry")

            vim.keymap.set("n", "<leader>L", ":Mason<CR>")

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
        end,
    },
}

