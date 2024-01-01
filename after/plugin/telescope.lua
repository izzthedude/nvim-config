local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) 

-- Telescope file browser
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  ":Telescope file_browser initial_mode=normal path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
