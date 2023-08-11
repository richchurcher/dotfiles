vim.o.autoindent = true
vim.o.background = "dark"
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 2
vim.o.noemoji = true
vim.o.expandtab = true
vim.o.number = true
vim.o.history = 1000
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.list = false
vim.o.relativenumber = true
vim.o.scrolloff = 3
vim.o.scrolljump = 5
vim.o.shiftwidth = 4
vim.o.showmatch = true
vim.o.shortmess = "at"
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.splitright = true
vim.o.statusline = " %t [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L %P"
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.textwidth = 100
vim.o.whichwrap = "b,s,h,l,<,>,[,]"
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,full"
vim.o.wrap = false
vim.o.wrapmargin = 0

vim.g.tpipeline_fillcenter = 1
vim.g.tpipeline_preservebg = 1

-- nord
vim.g.nord_bold = false
vim.g.nord_contrast = true
vim.g.nord_italic = false
local grpid = vim.api.nvim_create_augroup('custom_highlights_nord', {})
vim.api.nvim_create_autocmd('ColorScheme', {
    group = grpid,
    pattern = 'nord',
    command = 'hi @comment gui=italic |' ..
        'hi @keyword gui=bold'
})
require("nord").set()

-- diagnostics
vim.diagnostic.config({
    virtual_text = false,
    float = {
        max_width = 100,
    },
})

-- ripgrep
if vim.fn.executable("rg") == 1 then
    vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
    vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- neoterm
vim.g.neoterm_autoinsert = 1

-- fzf
require 'fzf-lua'.setup {
    files = {
        fd_opts =
        '-t f -H -I -E "{.git,node_modules,tags,dist,.wine,__pypackages__,_tmp,_postgres/data,.dartServer}"'
    }
}

-- disable Perl provider
vim.g.loaded_perl_provider = 0

-- python
vim.g.python_host_prog = vim.env.XDG_DATA_HOME .. "/rtx/installs/python/2.7.18/bin/python2"
vim.g.python3_host_prog = vim.env.XDG_DATA_HOME .. "/rtx/installs/python/3.11.4/bin/python"

-- lsp
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "gopls",
        "lua_ls",
        "pylsp",
        "rust_analyzer",
        "terraformls",
        "tflint",
        "tsserver",
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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

local signs = { Error = "⛔", Warn = "⚠️", Hint = "💡", Info = "ℹ️ " }
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

local lspconfig = require("lspconfig")

lspconfig['dartls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig['pylsp'].setup {
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

lspconfig['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig['rust_analyzer'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig['lua_ls'].setup {
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

lspconfig['gopls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig['terraformls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}

require('Comment').setup()

require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
            config = {
                folds = false,
            }
        },
    },
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'nord',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { _G.pathcondense },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}

require('leap').set_default_keymaps()

require('rest-nvim').setup {
    result_split_horizontal = false,
    result_split_in_place = false,
    skip_ssl_verification = false,
    encode_url = true,
    highlight = {
        enabled = true,
        timeout = 150,
    },
    result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,
        formatters = {
            json = "jq",
        },
    },
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
    yank_dry_run = true,
}

require "nvim-treesitter.configs".setup {
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}
