-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})

    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use 'karb94/neoscroll.nvim'

    use "folke/which-key.nvim"

    use 'zaldih/themery.nvim'

    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

    use 'vim-test/vim-test'
    use 'gorbit99/codewindow.nvim'
    use 'nvim-pack/nvim-spectre'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'jaimecgomezz/here.term'

    -- themes 
    use 'Mofiqul/vscode.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "folke/tokyonight.nvim", as = "tokynight" }
    use { "rebelot/kanagawa.nvim", as = "kanagawa" }
    use "EdenEast/nightfox.nvim"
    use "rose-pine/neovim"
    use 'sainnhe/everforest'
end)
