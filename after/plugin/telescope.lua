local builtin = require("telescope.builtin")

-- Keymaps
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ss', builtin.live_grep, {})

