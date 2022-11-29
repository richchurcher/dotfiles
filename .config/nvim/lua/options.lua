vim.o.autoindent = true
-- vim.o.autochdir = true
vim.o.background = "dark"
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 2
vim.o.expandtab = true
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
vim.g.nord_contrast = true
vim.g.nord_italic = false

-- diagnostics
vim.diagnostic.config({
  virtual_text = false,
  float = {
    max_width = 100,
  },
})

-- nerdcommenter
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDTrimTrailingWhitespace = 1

-- ripgrep
if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- vim-gutentags
-- vim.g.gutentags_ctags_exclude = {
--   '.git',
--   '__pypackages__',
--   'Cargo.lock',
--   'cdk.out',
--   'node_modules',
--   'package-lock.json',
--   'target',
--   'yarn.lock',
-- }

-- neoterm
vim.g.neoterm_autoinsert = 1

-- fzf
require 'fzf-lua'.setup {
  files = {
    rg_opts = '--column --files --line-number --no-heading --color=never --smart-case --hidden --no-ignore --glob "!{.git,node_modules,tags,package-lock.json,yarn.lock,coverage,dist,.aws-sam,.wine,__pypackages__,cdk.out}"'
  }
}

-- python
vim.g.python_host_prog = vim.env.XDG_DATA_HOME .. "/pdm/venvs/nvim-f7TAPNao-nvim2/bin/python"
vim.g.python3_host_prog = vim.env.XDG_DATA_HOME .. "/pdm/venvs/nvim-f7TAPNao-nvim3/bin/python"

-- firenvim
vim.g.firenvim_config = {
  globalSettings = { alt = "all", },
  localSettings = {
    [".*"] = {
      cmdline = "neovim",
      content = "text",
      priority = 0,
      selector = "textarea",
      takeover = "never",
    },
  }
}

-- Disable `firenvim` for the particular webiste
vim.cmd 'let fc = g:firenvim_config["localSettings"]'
vim.cmd 'let fc["https?://twitter.com/"] = { "takeover": "never", "priority": 1 }'
vim.cmd 'let fc["https?://twitter.tv/"] = { "takeover": "never", "priority": 1 }'
vim.cmd 'let fc["https?://mail.google.com/"] = { "takeover": "never", "priority": 1 }'

-- lsp
require("nvim-lsp-installer").setup {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
})

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettierd,
    require("null-ls").builtins.formatting.gofmt,
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.terraform_fmt,
  },
  debug = true
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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

cmp.setup.filetype('markdown', {
  sources = cmp.config.sources({}), {}
})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    -- NOTE: nvim 0.8+ seems to handle this better without the filter
    -- filter = function(client)
    --   return client.name == "null-ls" or client.name == "sumneko_lua" or client.name == "rust_analyzer"
    -- end,
    bufnr = bufnr,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
      group = augroup,
    })
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['pylsp'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 100,
        }
      }
    }
  }
}

require('lspconfig')['tsserver'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig')['sumneko_lua'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'use', 'vim' }
      }
    }
  }
}

require('lspconfig')['gopls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig')['terraformls'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {
      config = {
        folds = false,
      }
    },
  },
}

require('lualine').setup {
  options = {
    theme = 'nord'
  }
}

require('leap').set_default_keymaps()
