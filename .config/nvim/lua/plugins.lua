return require("packer").startup(function()
  use "wbthomason/packer.nvim"

  use "airblade/vim-gitgutter"
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
  use "sheerun/vim-polyglot"
  use "stefandtw/quickfix-reflector.vim"
  use "tpope/vim-eunuch"
  use "tpope/vim-fugitive"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use "xolox/vim-misc"

  use { "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } }

  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

-- sometimes
-- "guns/xterm-color-table.vim"
-- "raghur/vim-ghost", { 'do': ':GhostInstall' }
-- "wlangstroth/vim-racket", { 'for': ['racket', 'scheme'] }

end)
