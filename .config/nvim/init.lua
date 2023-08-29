require("functions")
require("plugins")
require("mappings")
require("options")
require("treesitter")

vim.cmd "colorscheme duskfox"

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "**/lua/*.lua",
    callback = function()
        local filepath = vim.fn.expand("%")

        dofile(filepath)
    end,
})
