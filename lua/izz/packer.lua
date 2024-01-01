vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    
    -- Telescope file browser
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    
    -- One Dark theme
    use 'navarasu/onedark.nvim'
end)
