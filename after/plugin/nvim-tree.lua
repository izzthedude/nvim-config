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

        -- Open file and close tree
        vim.keymap.set('n', '<CR>', function ()
            api.node.open.edit()
            api.tree.close()
        end, opts('Open: Close Tree'))
        -- Open tree if visible, else toggle it
        vim.keymap.set('n', '<leader>F',function ()
            if api.tree.is_visible() then
                api.tree.open()
            else
                api.tree.toggle()
            end
        end, {})
    end,
    view = {
        width = 40,
    }
})
