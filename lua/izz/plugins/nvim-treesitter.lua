return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup {
                ensure_installed = {
                    "regex",
                    "bash",
                    "dockerfile",
                    "json",
                    "toml",
                    "yaml",
                    "meson",
                    "python",
                    "rust",
                    "c",
                    "lua",
                    "html",
                    "css",
                    "javascript",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },

                -- Integrate autotag
                autotag = { enable = true }
            }
        end
    },
}

