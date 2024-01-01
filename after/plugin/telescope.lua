local telescope = require("telescope")
local builtin = require("telescope.builtin")
local fb_actions = require("telescope").extensions.file_browser.actions

-- Base keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) 
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser initial_mode=normal<CR>', {})

telescope.setup {
    extensions = {
        -- File browser
        file_browser = {
            hijack_netrw = true,
            initial_mode="normal",
            mappings = {
                ["i"] = {
                    ["<bs>"] = false,
                },
                ["n"] = {
                    ["-"] = fb_actions.goto_parent_dir
                },
            },
        }
    }
}
telescope.load_extension("file_browser")

