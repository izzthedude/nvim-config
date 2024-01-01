local ts_configs = require("nvim-treesitter.configs")

ts_configs.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
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

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    -- List of parsers to ignore installing (or "all")
    ignore_install = {},

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- disable = {},
        -- disable = function(lang, buf)
            --local max_filesize = 100 * 1024 -- 100 KB
            --local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            --if ok and stats and stats.size > max_filesize then
                --return true
            --end
        --end,

        additional_vim_regex_highlighting = false,
    },
}
