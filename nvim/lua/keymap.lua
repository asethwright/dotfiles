vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<A-j>", ":m .+1<cr>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi")
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi")

vim.keymap.set("n", "<leader>q", "<cmd>:q<cr>")

vim.keymap.set("n", "[b", "<cmd>bprevious<cr>")
vim.keymap.set("n", "]b", "<cmd>bnext<cr>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-space>", "<cmd>Telescope buffers show_all_buffers=true<cr>", { desc = "Goto buffer" })
vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>", { desc = "Goto file" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Goto line" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Goto commit" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Goto branch" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Goto branch" })
vim.keymap.set("n", "<leader>o", function()
  local util = require("plugins.telescope")
  util.symbols()
end, { desc = "Goto symbol" })

vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>")
vim.keymap.set("n", ",w", "<cmd>:w<cr>")

vim.keymap.set("n", "<leader>b", "<cmd>Neotree toggle<cr>", { desc = "Show file explorer" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Show file explorer" })

vim.keymap.set("n", ",tw", "<cmd>set invwrap<CR><cmd>set wrap?<CR><cmd>set linebreak<CR>", { silent = true })
vim.keymap.set("n", ",,a", "ggVG", { desc = "Select entire file" })

vim.keymap.set("n", "+", "<cmd>wincmd =<cr>", { silent = true })
vim.keymap.set("n", "=", "<cmd>vertical resize +10<cr>", { silent = true })
vim.keymap.set("n", "-", "<cmd>vertical resize -10<cr>", { silent = true })

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
