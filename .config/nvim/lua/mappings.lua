local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ","
vim.g.maplocalleader = " "

map("n", "<Leader>w", "<cmd>:w<CR>")
map("i", "jk", "<Esc>")
map("n", "<Leader>q", "<cmd>:q<CR>")

-- Tab navigates completions
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })

map('n', '<Leader>n', '<cmd>:noh<CR>') -- clear search highlight

-- init.lua
map("n", "<Leader>ei", "<cmd>:e " .. vim.env.MYVIMRC .. "<CR>")
map("n", "<Leader>ep", "<cmd>:e " .. vim.env.XDG_CONFIG_HOME .. "/nvim/lua/plugins.lua<CR>")
map("n", "<Leader>em", "<cmd>:e " .. vim.env.XDG_CONFIG_HOME .. "/nvim/lua/mappings.lua<CR>")
map("n", "<Leader>eo", "<cmd>:e " .. vim.env.XDG_CONFIG_HOME .. "/nvim/lua/options.lua<CR>")

-- fzf
map("n", "<C-p>", "<cmd>:FzfLua files<CR>")
map("n", "<Leader>pl", "<cmd>:FzfLua lgrep_curbuf<CR>")
map("n", "<Leader>pc", "<cmd>:FzfLua git_bcommits<CR>")
map("n", "<Leader>pg", "<cmd>:FzfLua live_grep<CR>")

-- windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-h>", "<C-\\><C-n><C-w>h")
map("n", "<C-j>", "<C-\\><C-n><C-w>j")
map("n", "<C-k>", "<C-\\><C-n><C-w>k")
map("n", "<C-l>", "<C-\\><C-n><C-w>l")

-- buffers
map("n", "<Leader>.", "<cmd>:bn<CR>")
map("n", "<Leader>,", "<cmd>:bp<CR>")
map("n", "<Leader>bd", "<cmd>:bd<CR>")

-- splits
map("n", "<Leader>vs", "<cmd>:vs<CR>")
map("n", "<Leader>sp", "<cmd>:sp<CR>")
map("n", "<Leader>m", "<C-W><Bar>") -- maximise current

-- move within a wrapped line
map("n", "j", "gj")
map("n", "k", "gk")

-- working directory
map("c", "cd.", "lcd %:p:h")

-- indent without leaving visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- fugitive
map("n", "<Leader>gs", "<cmd>:Git<CR>", { silent = true })
map("n", "<Leader>gd", "<cmd>:Git diff<CR>", { silent = true })
map("n", "<Leader>gc", "<cmd>:Git commit<CR>", { silent = true })
map("n", "<Leader>gb", "<cmd>:Git blame -c<CR>", { silent = true })
map("n", "<Leader>gl", "<cmd>:Git log<CR>", { silent = true })
map("n", "<Leader>gp", "<cmd>:Git -c push.default=current push<CR>", { silent = true })
map("n", "<Leader>gw", "<cmd>:Gwrite<CR>", { silent = true })
map("n", "<Leader>du", "<cmd>:diffupdate<CR>", { silent = true })
map("n", "<Leader>dgt", "<cmd>:diffget //2<CR>", { silent = true }) -- target branch
map("n", "<Leader>dgm", "<cmd>:diffget //3<CR>", { silent = true }) -- merge branch

-- comment paragraph text object (by selecting it first)
-- (see https://github.com/preservim/nerdcommenter#motions)
map("n", "<Leader>c}", "V}<cmd>:call NERDComment('x', 'toggle')<CR>", { silent = true })
map("n", "<Leader>c{", "V{<cmd>:call NERDComment('x', 'toggle')<CR>", { silent = true })

-- terminal
map("n", "<Leader>`", "<cmd>:below Tnew<CR>")
map("t", "<Leader>`", "<C-\\><C-N>")
map("n", "<Leader>tel", "<cmd>:TREPLSendLine<CR>")
map("n", "<Leader>tef", "<cmd>:TREPLSendFile<CR>")
map("n", "<Leader>tee", "<cmd>:TREPLSendSelection<CR>")
map("n", "<Leader>tec", "<cmd>:Tclear<CR>")

-- ripgrep
map("n", "<Leader>rg", "<cmd>:Rg<space><CR>")
map("n", "<Leader>rr", "<cmd>:Rr<CR>")
map("n", "<Leader>gg", "<cmd>:GGrep<CR>")
map("n", "<Leader>ff", "<cmd>:Files<CR>")

-- lsp
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "]c", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "[c", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
