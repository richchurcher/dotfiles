-- NOTE: from https://github.com/bennypowers/dotfiles/blob/master/.config/nvim/init.lua
-- START COPYPASTA https://github.com/neovim/neovim/commit/5b04e46d23b65413d934d812d61d8720b815eb1c
local util = require 'vim.lsp.util'
--- Formats a buffer using the attached (and optionally filtered) language
--- server clients.
---
--- @param options table|nil Optional table which holds the following optional fields:
---     - formatting_options (table|nil):
---         Can be used to specify FormattingOptions. Some unspecified options will be
---         automatically derived from the current Neovim options.
---         @see https://microsoft.github.io/language-server-protocol/specification#textDocument_formatting
---     - timeout_ms (integer|nil, default 1000):
---         Time in milliseconds to block for formatting requests. Formatting requests are current
---         synchronous to prevent editing of the buffer.
---     - bufnr (number|nil):
---         Restrict formatting to the clients attached to the given buffer, defaults to the current
---         buffer (0).
---     - filter (function|nil):
---         Predicate to filter clients used for formatting. Receives the list of clients attached
---         to bufnr as the argument and must return the list of clients on which to request
---         formatting. Example:
---
---         <pre>
---         -- Never request typescript-language-server for formatting
---         vim.lsp.buf.format {
---           filter = function(clients)
---             return vim.tbl_filter(
---               function(client) return client.name ~= "tsserver" end,
---               clients
---             )
---           end
---         }
---         </pre>
---
---     - id (number|nil):
---         Restrict formatting to the client with ID (client.id) matching this field.
---     - name (string|nil):
---         Restrict formatting to the client with name (client.name) matching this field.
vim.lsp.buf.format = function(options)
	options = options or {}
	local bufnr = options.bufnr or vim.api.nvim_get_current_buf()
	local clients = vim.lsp.buf_get_clients(bufnr)

	if options.filter then
		clients = options.filter(clients)
	elseif options.id then
		clients = vim.tbl_filter(
			function(client) return client.id == options.id end,
			clients
		)
	elseif options.name then
		clients = vim.tbl_filter(
			function(client) return client.name == options.name end,
			clients
		)
	end

	clients = vim.tbl_filter(
		function(client) return client.supports_method 'textDocument/formatting' end,
		clients
	)

	if #clients == 0 then
		vim.notify '[LSP] Format request failed, no matching language servers.'
	end

	local timeout_ms = options.timeout_ms or 1000
	for _, client in pairs(clients) do
		local params = util.make_formatting_params(options.formatting_options)
		local result, err = client.request_sync('textDocument/formatting', params, timeout_ms, bufnr)
		if result and result.result then
			util.apply_text_edits(result.result, bufnr, client.offset_encoding)
		elseif err then
			vim.notify(string.format('[LSP][%s] %s', client.name, err), vim.log.levels.WARN)
		end
	end
end
-- END COPYPASTA

vim.o.autoindent = true
vim.o.background = "dark"
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.completeopt = "menu,menuone,noselect"
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
vim.o.shortmess = "at"
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
vim.g["airline#extensions#default#section_truncate_width"] = { c = 0 } -- avoid collapsing filename section

-- vim-gitgutter
-- vim.g.gitgutter_sign_added              = '+'
-- vim.g.gitgutter_sign_removed            = '_'
-- vim.g.gitgutter_sign_removed_first_line = '‾'
-- vim.g.gitgutter_sign_modified           = ''
-- vim.g.gitgutter_sign_modified_removed   = vim.g.signify_sign_change

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
require 'fzf-lua'.setup {
	files = {
		rg_opts = '--column --files --line-number --no-heading --color=never --smart-case --hidden --no-ignore --glob "!{.git,node_modules,tags,package-lock.json,yarn.lock,coverage,dist,.aws-sam,.wine}"'
	}
}

-- python
vim.g.python_host_prog = vim.env.XDG_DATA_HOME .. "/pdm/venvs/nvim-f7TAPNao-nvim2/bin/python"
vim.g.python3_host_prog = vim.env.XDG_DATA_HOME .. "/pdm/venvs/nvim-f7TAPNao-nvim3/bin/python"

-- lsp
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
})

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.prettierd,
	}
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(clients)
			return vim.tbl_filter(function(client)
				return client.name ~= "tsserver"
			end, clients)
		end,
		bufnr = bufnr
	})
end

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<TAB>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'buffer' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'tags' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		flags = {
			debounce_text_changes = 150,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						lsp_formatting(bufnr)
					end,
				})
			end
		end,
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'use', 'vim' }
				}
			},
		}
	}
	server:setup(opts)
end)
