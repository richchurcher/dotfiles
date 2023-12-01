vim.o.autoindent = true
vim.o.background = "dark"
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 2
vim.o.emoji = true
vim.o.expandtab = true
vim.o.exrc = true
if vim.fn.executable("rg") == 1 then
    vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
    vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end
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

vim.g.loaded_perl_provider = 0
vim.g.neoterm_autoinsert = 1
vim.g.python_host_prog = vim.env.XDG_DATA_HOME .. "/rtx/installs/python/2.7.18/bin/python2"
vim.g.python3_host_prog = vim.env.XDG_DATA_HOME .. "/rtx/installs/python/3.11.4/bin/python"
vim.g.tpipeline_fillcenter = 1
vim.g.tpipeline_preservebg = 1

vim.diagnostic.config({
    virtual_text = false,
    float = {
        max_width = 200,
    },
})

vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '🟢', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '⚡', texthl = '', linehl = '', numhl = '' })


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
        { name = 'cody' },
        { name = "copilot" },
        { name = "neorg" },
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


require('Comment').setup()

require("copilot").setup({
    panel = { enabled = false },
    suggestion = { enabled = false },
})
require("copilot_cmp").setup()

local dap, dapui = require("dap"), require("dapui")
require("flutter-tools").setup({
    debugger = {
        enabled = true,
        exception_breakpoints = {},
        run_via_dap = true,
    },
    dev_log = {
        enabled = false,
    }
})

require("fzf-lua").setup {
    files = {
        fd_opts =
        '-t f -H -I -E "{.git,node_modules,tags,dist,.wine,__pypackages__,_tmp,_postgres/data,.dartServer,build,.dart_tool,.idea}"'
    }
}

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require('dap-go').setup()
require('nvim-dap-virtual-text').setup()
require("gitsigns").setup()

require('leap').add_default_mappings()

require("neorg").setup {
    load = {
        ["core.defaults"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
        ["core.integrations.treesitter"] = {},
        ["core.keybinds"] = {},
    },
}

local lspconfig = require("lspconfig")

require('lualine').setup {
    options = {
        always_divide_middle = true,
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        globalstatus = false,
        icons_enabled = true,
        ignore_focus = {},
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
        section_separators = { left = '', right = '' },
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

require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "gopls",
        "lua_ls",
        "pylsp",
        -- "rust_analyzer",
        "terraformls",
        "texlab",
        "tflint",
        "tsserver",
    }
}

require("neodev").setup({
    library = {
        plugins = {
            "nvim-dap-ui",
        },
        types = true,
    },
})

require("nightfox").setup({
    groups = {
        all = {
            ["@text.note"] = { fg = "white", bg = "none" },
            ["@text.todo"] = { fg = "orange", bg = "none" },
        }
    },
    options = {
        styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
        }
    }
})

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

-- dap.configurations.rust = {
--     {
--         name = 'Launch',
--         type = 'lldb',
--         request = 'launch',
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = true,
--         args = {},
--
--         -- 💀
--         -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--         --
--         --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--         --
--         -- Otherwise you might get the following error:
--         --
--         --    Error on launch: Failed to attach to the target process
--         --
--         -- But you should be aware of the implications:
--         -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--         -- runInTerminal = false,
--         initCommands = function()
--             -- Find out where to look for the pretty printer Python module
--             local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
--
--             local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
--             local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
--
--             local commands = {}
--             local file = io.open(commands_file, 'r')
--             if file then
--                 for line in file:lines() do
--                     table.insert(commands, line)
--                 end
--                 file:close()
--             end
--             table.insert(commands, 1, script_import)
--
--             return commands
--         end,
--         -- ...,
--     },
-- }

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        bufnr = bufnr,
    })
end

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
    -- LSP semantic tokens conflicts with Treesitter, turn it off:
    client.server_capabilities.semanticTokensProvider = nil
end


vim.g.rustaceanvim = {
    server = {
        on_attach = on_attach,
    },
}

require("sg").setup {
    auth_strategy = { "nvim" },
    on_attach = on_attach,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
})

-- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local signs = { Error = "⛔", Warn = "⚠️", Hint = "💡", Info = "ℹ️ " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspconfig['html'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig['gopls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig['jsonls'].setup {
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
            },
            workspace = {
                checkThirdParty = false,
            },
        }
    }
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

-- lspconfig['rust_analyzer'].setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }

lspconfig['terraformls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}

lspconfig['texlab'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
