vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function()
	use "wbthomason/packer.nvim"

	use "arcticicestudio/nord-vim"
	use "drewtempelmeyer/palenight.vim"
	use "edkolev/tmuxline.vim"
	use "glacambre/firenvim"
	use "joshdick/onedark.vim"
	use "justinmk/vim-dirvish"
	use "justinmk/vim-sneak"
	use "kassio/neoterm"
	use "leafOfTree/vim-svelte-plugin"
	use "ludovicchabant/vim-gutentags"
	use "matze/vim-move"
	use "preservim/nerdcommenter"
	use "puremourning/vimspector"
	use "stefandtw/quickfix-reflector.vim"
	use "tpope/vim-eunuch"
	use "tpope/vim-fugitive"
	use "tpope/vim-surround"
	use "tpope/vim-unimpaired"
	use "vim-airline/vim-airline"
	use "vim-airline/vim-airline-themes"
	use "xolox/vim-misc"

	use { "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } }

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("treesitter")
		end,
	}

	-- lsp/formatting
	use {
		"williamboman/nvim-lsp-installer",
		{
			"neovim/nvim-lspconfig"
		}
	}
	use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }

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

	-- sometimes
	-- "guns/xterm-color-table.vim"
	-- "raghur/vim-ghost", { 'do': ':GhostInstall' }
	-- "wlangstroth/vim-racket", { 'for': ['racket', 'scheme'] }

end)
