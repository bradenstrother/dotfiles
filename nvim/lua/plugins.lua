---@diagnostic disable: undefined-global
return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

    -- Color scheme
    use { 'sainnhe/everforest' }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup({
            close_on_exit = false,
            autochdir = true,
            shell = vim.o.shell,
            size = 20
        })
    end }
    use { 'nvim-tree/nvim-tree.lua' }

    -- neogit
    use { 'treatybreaker/neogit', requires = 'nvim-lua/plenary.nvim', config = function()
        require('neogit').setup()
    end
    }

    -- diffview
    use { "sindrets/diffview.nvim",
        config = function()
            require('diffview').setup()
        end
    }

    -- New plugins as of 08/04/2023
    -- nvim.coc
    use { 'neoclide/coc.nvim', branch = 'release' }

    -- ufo, for code folding
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    -- Indent blankline
    use { "lukas-reineke/indent-blankline.nvim",
        tag = "v2.20.8",
    }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }

    -- treesj - 08/25/2023
    use({
        'Wansmer/treesj',
        -- Treesitter functions depending on what 'parsers' are installed.
        -- For more info, see:
        -- https://github.com/nvim-treesitter/nvim-treesitter#language-parsers
        -- 2023-08-05 16:26
        requires = { 'nvim-treesitter/nvim-treesitter' },
    })

    use { 'numToStr/Comment.nvim' }

    use { 'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }

    use { 'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- harpoon
    -- Plenary dependency isn't defined because Telescope already has it defined
    -- as a dependency
    use { 'ThePrimeagen/harpoon' }

    -- bufferline
    use { 'akinsho/bufferline.nvim', tag = 'v4.4.0' }

    -- flask
    use { 'folke/flash.nvim', tag = 'v1.18.2' }


    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'rafamadriz/friendly-snippets' }

    -- vim surround
    use { 'tpope/vim-surround' }

    -- gp
    use { 'robitx/gp.nvim' }
    use {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    }
    use {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    }
    use { "Bilal2453/luvit-meta", lazy = true } -- optional `vim.uv` typings
end)
