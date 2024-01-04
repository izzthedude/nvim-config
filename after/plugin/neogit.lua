local neogit = require("neogit")

vim.keymap.set(
    "n",
    "<leader>G",
    function()
        neogit.open( { kind = "vsplit"} )
    end,
    {}
)

