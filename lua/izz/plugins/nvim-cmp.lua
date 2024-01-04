return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function ()
        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_cmp()

        local cmp = require('cmp')

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.confirm({
                    select = true,
                    behavior = cmp.ConfirmBehavior.Replace,
                }),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true,
                    behavior = cmp.ConfirmBehavior.Insert,
                }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            })
        })
    end
}

