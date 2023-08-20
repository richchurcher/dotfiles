-- Remember, if this breaks on MacOS: homebrew is installing parsers and
-- queries in:
--   /opt/homebrew/Cellar/neovim/0.8.3/lib/nvim/parser
--   /opt/homebrew/Cellar/neovim/0.8.3/share/nvim/runtime/queries
--
-- These should all be removed, and their nvim-treesitter counterparts
-- installed. This is the dreaded "invalid node type" error. See:
--
--   https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function()
    use "wbthomason/packer.nvim"

    use "edeneast/nightfox.nvim"
    use "folke/neodev.nvim"
    use "ggandor/leap.nvim"
    use "kassio/neoterm"
    use 'lewis6991/gitsigns.nvim'
    use "matze/vim-move"
    use "neovim/nvim-lspconfig"
    use "numToStr/Comment.nvim"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "tpope/vim-surround"
    use "tpope/vim-unimpaired"
    use "vimpostor/vim-tpipeline"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "quangnguyen30192/cmp-nvim-tags",
        }
    }
    use { "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } }
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use {
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- other good colo's
    -- use "cocopon/iceberg.vim"
    -- use "phha/zenburn.nvim"
    -- use "rebelot/kanagawa.nvim"
    -- use "sainnhe/everforest"
    -- use "shaunsingh/nord.nvim"
end)
