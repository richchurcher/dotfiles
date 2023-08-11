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

    use "cocopon/iceberg.vim"
    use "drewtempelmeyer/palenight.vim"
    use "ggandor/leap.nvim"
    use "joshdick/onedark.vim"
    use "justinmk/vim-dirvish"
    use "kassio/neoterm"
    use "matze/vim-move"
    use "numToStr/Comment.nvim"
    use "nvim-neorg/neorg"
    use "puremourning/vimspector"
    use "shaunsingh/nord.nvim"
    use "stefandtw/quickfix-reflector.vim"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "tpope/vim-surround"
    use "tpope/vim-unimpaired"
    use "vimpostor/vim-tpipeline"
    use "xolox/vim-misc"

    use { "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
    -- use { "nvim-treesitter/playground" }

    -- lsp/formatting
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    -- use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }

    -- autocomplete
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

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    use {
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
end)
