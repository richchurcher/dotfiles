local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "edeneast/nightfox.nvim",
    "folke/neodev.nvim",
    "ggandor/leap.nvim",
    "kassio/neoterm",
    "lewis6991/gitsigns.nvim",
    "matze/vim-move",
    "neovim/nvim-lspconfig",
    "numToStr/Comment.nvim",
    "tpope/vim-eunuch",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    "vimpostor/vim-tpipeline",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "zbirenbaum/copilot.lua",
    {
        'akinsho/flutter-tools.nvim',
        config = true,
        dependencies = {
            'stevearc/dressing.nvim',
        },
        lazy = false,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "quangnguyen30192/cmp-nvim-tags",
            "zbirenbaum/copilot-cmp",
        }
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
    },
    -- Remember, if this breaks on MacOS: homebrew is installing parsers and
    -- queries in:
    --   /opt/homebrew/Cellar/neovim/0.8.3/lib/nvim/parser
    --   /opt/homebrew/Cellar/neovim/0.8.3/share/nvim/runtime/queries
    --
    -- These should all be removed, and their nvim-treesitter counterparts
    -- installed. This is the dreaded "invalid node type" error. See:
    --
    --   https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    "leoluz/nvim-dap-go",
    "theHamsta/nvim-dap-virtual-text",
    {
        "rest-nvim/rest.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        -- dev = true,
        'mrcjkb/rustaceanvim',
        ft = { 'rust' },
    },
    {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- {
    --     dev = true,
    --     dir = "~/w/plugins/foo",
    --     name = "foo",
    -- }
    -- other good colo's
    -- use "cocopon/iceberg.vim"
    -- use "phha/zenburn.nvim"
    -- use "rebelot/kanagawa.nvim"
    -- use "sainnhe/everforest"
    -- use "shaunsingh/nord.nvim"
}, {
    dev = {
        path = "~/w",
        patterns = {},
        fallback = false,
    },
})
