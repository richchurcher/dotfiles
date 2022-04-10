vim.o.autoindent = true
vim.o.background = "dark"
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.number = true
vim.o.history = 1000
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.list = false
vim.o.relativenumber = true
vim.o.scrolloff = 3
vim.o.scrolljump = 5
vim.o.shiftwidth = 2
vim.o.showmatch = true
vim.o.shortmess = "c"
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.splitright = true
vim.o.statusline = " %t [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L %P"
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.textwidth = 100
vim.o.whichwrap = "b,s,h,l,<,>,[,]"
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,full"
vim.o.wrap = false
vim.o.wrapmargin = 0

-- nord
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

-- airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "nord"
vim.g["airline#extensions#tmuxline#enabled"] = 1
vim.g["airline#extensions#tmuxline#snapshot_file"] = vim.env.XDG_CONFIG_HOME .. "/tmux/tmux-status.conf"
vim.g.airline_section_c = "%{v:lua.pathcondense()}"
vim.g["airline#extensions#default#section_truncate_width"] = { c=0 } -- avoid collapsing filename section

-- vim-gitgutter 
vim.g.gitgutter_sign_added               = '+'
vim.g.gitgutter_sign_removed             = '_'
vim.g.gitgutter_sign_removed_first_line  = '‾'
vim.g.gitgutter_sign_modified            = ''
vim.g.gitgutter_sign_modified_removed    = vim.g.signify_sign_change
--
-- highlight lines in Sy and vimdiff etc.
vim.cmd "hi DiffAdd cterm=bold ctermbg=none ctermfg=34"
vim.cmd "hi DiffDelete cterm=bold ctermbg=none ctermfg=16"
vim.cmd "hi DiffChange cterm=bold ctermbg=none ctermfg=4"

-- nerdcommenter
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1

-- sneak
vim.g["sneak#label"] = 1
vim.cmd "hi link Sneak IncSearch"
vim.cmd "hi link SneakScope Visual"
vim.cmd "hi link SneakLabel DiffChange"

-- ripgrep
if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- vim-gutentags
vim.g.gutentags_ctags_exclude = { 'node_modules', '.git', 'package-lock.json', 'yarn.lock', 'target', 'Cargo.lock' }

-- neoterm
vim.g.neoterm_autoinsert = 1

-- fzf
require'fzf-lua'.setup {
  files = {
    rg_opts = '--column --files --line-number --no-heading --color=never --smart-case --hidden --no-ignore --glob "!{.git,node_modules,tags,package-lock.json,yarn.lock,coverage,dist,.aws-sam,.wine}"'
  }
}

-- python
vim.g.python_host_prog = vim.env.XDG_DATA_HOME .. "/pdm/venvs/nvim-f7TAPNao-nvim2/bin/python"
vim.g.python3_host_prog = vim.env.XDG_DATA_HOME .. "/pdm/venvs/nvim-f7TAPNao-nvim3/bin/python"

-- lsp
require("nvim-lsp-installer").on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- local on_attach = function(client, bufnr)
--   vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--
-- local servers = { "rust_analyzer", "tsserver" }
-- for _, lsp in pairs(servers) do
--   require("lspconfig")[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end
