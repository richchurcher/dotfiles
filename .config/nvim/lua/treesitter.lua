require("nvim-treesitter.configs").setup({
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

