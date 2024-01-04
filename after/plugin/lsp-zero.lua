-- lsp-zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Mason
vim.keymap.set("n", "<leader>M", ":Mason<CR>")
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      "pylsp"
  },
  automatic_installation = true,
  handlers = {
    lsp_zero.default_setup,
  },
})

