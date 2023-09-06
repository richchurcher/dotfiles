vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Leader>w", "<cmd>:w<CR>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<Leader>q", "<cmd>:q<CR>")

-- Tab navigates completions
vim.keymap.set('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
vim.keymap.set('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })

vim.keymap.set('n', '<Leader>n', '<cmd>:noh<CR>') -- clear search highlight

-- init.lua
vim.keymap.set("n", "<Leader>ei", "<cmd>:e " .. vim.env.MYVIMRC .. "<CR>")
vim.keymap.set("n", "<Leader>ep", "<cmd>:e " .. vim.env.XDG_CONFIG_HOME .. "/nvim/lua/plugins.lua<CR>")
vim.keymap.set("n", "<Leader>em", "<cmd>:e " .. vim.env.XDG_CONFIG_HOME .. "/nvim/lua/mappings.lua<CR>")
vim.keymap.set("n", "<Leader>eo", "<cmd>:e " .. vim.env.XDG_CONFIG_HOME .. "/nvim/lua/options.lua<CR>")

-- fzf
vim.keymap.set("n", "<C-p>", "<cmd>:FzfLua files<CR>")
vim.keymap.set("n", "<Leader>ph", "<cmd>:FzfLua files cwd=~<CR>")
vim.keymap.set("n", "<Leader>pl", "<cmd>:FzfLua lgrep_curbuf<CR>")
vim.keymap.set("n", "<Leader>pc", "<cmd>:FzfLua git_bcommits<CR>")
vim.keymap.set("n", "<Leader>pg", "<cmd>:FzfLua live_grep<CR>")
vim.keymap.set("n", "<Leader>pb", "<cmd>:FzfLua buffers<CR>")
vim.keymap.set("n", "<Leader>ht", "<cmd>:FzfLua help_tags<CR>")

-- windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("n", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("n", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("n", "<C-l>", "<C-\\><C-n><C-w>l")

-- buffers
vim.keymap.set("n", "<Leader>.", "<cmd>:bn<CR>")
vim.keymap.set("n", "<Leader>,", "<cmd>:bp<CR>")
vim.keymap.set("n", "<Leader>bd", "<cmd>:bn|bd #<CR>")

-- splits
vim.keymap.set("n", "<Leader>vs", "<cmd>:vs<CR>")
vim.keymap.set("n", "<Leader>sp", "<cmd>:sp<CR>")
vim.keymap.set("n", "<Leader>m", "<C-W><Bar>") -- maximise current

-- move within a wrapped line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- working directory
vim.keymap.set("c", "cd.", "lcd %:p:h")

-- indent without leaving visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- fugitive
vim.keymap.set("n", "<Leader>gs", "<cmd>:Git<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gd", "<cmd>:Git diff<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gc", "<cmd>:Git commit<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gb", "<cmd>:Git blame -c<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gl", "<cmd>:Git log<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gp", "<cmd>:Git -c push.default=current push<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gw", "<cmd>:Gwrite<CR>", { silent = true })
vim.keymap.set("n", "<Leader>du", "<cmd>:diffupdate<CR>", { silent = true })
vim.keymap.set("n", "<Leader>dgt", "<cmd>:diffget //2<CR>", { silent = true }) -- target branch
vim.keymap.set("n", "<Leader>dgm", "<cmd>:diffget //3<CR>", { silent = true }) -- merge branch

-- terminal
vim.keymap.set("n", "<Leader>`", "<cmd>:below Tnew<CR>")
vim.keymap.set("t", "<Leader>`", "<C-\\><C-N>")
vim.keymap.set("n", "<Leader>tel", "<cmd>:TREPLSendLine<CR>")
vim.keymap.set("n", "<Leader>tef", "<cmd>:TREPLSendFile<CR>")
vim.keymap.set("n", "<Leader>tee", "<cmd>:TREPLSendSelection<CR>")
vim.keymap.set("n", "<Leader>tec", "<cmd>:Tclear<CR>")

-- lsp
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "]c", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "[c", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- rest.nvim
vim.keymap.set("n", "<Leader>rg", "<Plug>RestNvim<CR>")
vim.keymap.set("n", "<Leader>rp", "<Plug>RestNvimPreview<CR>")
vim.keymap.set("n", "<Leader>rl", "<Plug>RestNvimLast<CR>")
