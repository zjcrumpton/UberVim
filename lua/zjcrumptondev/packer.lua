-- Auto-install packer.nvim if not present
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

packer.startup(function(use)
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

    use 'b0o/nvim-tree-preview.lua'
    use 'voldikss/vim-floaterm'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    use {
        'greggh/claude-code.nvim',
            requires = {
                'nvim-lua/plenary.nvim', -- Required for git operations
        },
        config = function()
        require('claude-code').setup()
    end
}
    -- themes 
    use 'Mofiqul/vscode.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "folke/tokyonight.nvim", as = "tokynight" }
    use { "rebelot/kanagawa.nvim", as = "kanagawa" }
    use "EdenEast/nightfox.nvim"
    use "rose-pine/neovim"
    use 'sainnhe/everforest'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

