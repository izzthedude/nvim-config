require("nvim-tree").setup({
    on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
            return { 
                desc = "nvim-tree: " .. desc,
                buffer = bufnr, 
                noremap = true, 
                silent = true, 
                nowait = true 
            }
        end

        -- Defaults
        api.config.mappings.default_on_attach(bufnr)

        -- Custom
        vim.keymap.set('n', '?',     api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', '<leader>fb', api.tree.toggle, {})
    end,
    view = {
        width = 40,
    }
})
