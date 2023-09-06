require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "csv",
        "dart",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "gpg",
        "graphql",
        "hcl",
        "html",
        "http",
        "ini",
        "java",
        "javascript",
        "jq",
        "json",
        "json",
        "json5",
        "jsonc",
        "kotlin",
        "latex",
        "llvm",
        "lua",
        "luadoc",
        "luap",
        "luau",
        "make",
        "markdown",
        "markdown_inline",
        "norg",
        "passwd",
        "python",
        "query",
        "racket",
        "ruby",
        "rust",
        "scss",
        "sql",
        "terraform",
        "toml",
        "tsv",
        "vimdoc",
        "xml",
        "yaml",
    },
    sync_installed = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "js" },
    },
    indent = {
        enable = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
})
