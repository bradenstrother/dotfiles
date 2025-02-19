return {
    { 'sainnhe/everforest' },
    { "akinsho/toggleterm.nvim" },
    { 'nvim-tree/nvim-tree.lua' },
    -- ufo, for code folding
    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
    },
    { "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" },
    { "nvim-treesitter/nvim-treesitter" },
    -- treesj - 08/25/2023
    { 'Wansmer/treesj' },
    { 'numToStr/Comment.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { 'ThePrimeagen/harpoon' },
    {
        'akinsho/bufferline.nvim',
        tag = 'v4.4.0',
    },
    {
        'folke/which-key.nvim',
        tag = 'v3.13.3',
    },
    { "j-hui/fidget.nvim" },
    { 'folke/flash.nvim' },
    --nvim-cmp
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'rafamadriz/friendly-snippets' },
    -- vim surround
    { 'tpope/vim-surround' },
    -- gp
    { 'robitx/gp.nvim' },
    -- Make sure the following LSP plugins are in this order.
    {
        'williamboman/mason.nvim',
        lazy = false,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    'nvim-pack/nvim-spectre',
    'mbbill/undotree',
    'lewis6991/gitsigns.nvim',
    'nvimdev/lspsaga.nvim',
    { "folke/neodev.nvim", opts = {} },
    {
        'mg979/vim-visual-multi',
        -- See https://github.com/mg979/vim-visual-multi/issues/241
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_maps = {
                ['Find Under'] = ''
            }
            vim.g.VM_add_cursor_at_pos_no_mappings = 1
        end,
    },
}
