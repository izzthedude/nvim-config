-- lsp-zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    local opts = {buffer = bufnr}
    lsp_zero.default_keymaps(opts)
end)

lsp_zero.setup_servers({'pyright', 'pylsp'})
