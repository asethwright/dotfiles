-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>q", "<cmd>:q<cr>", { desc = "Quit" })

vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

vim.keymap.set("n", "+", "<cmd>wincmd =<cr>", { silent = true })
vim.keymap.set("n", "=", "<cmd>vertical resize +10<cr>", { silent = true })
vim.keymap.set("n", "-", "<cmd>vertical resize -10<cr>", { silent = true })

vim.keymap.set("n", ",tw", "<cmd>set invwrap<CR><cmd>set wrap?<CR><cmd>set linebreak<CR>", { silent = true })
vim.keymap.set("n", ",,a", "ggVG", { desc = "Select entire file" })
vim.keymap.del("v", "<")
vim.keymap.del("v", ">")

vim.keymap.set({ "n", "v" }, "<PageUp>", "<C-u>", { silent = true })
vim.keymap.set({ "n", "v" }, "<PageDown>", "<C-d>", { silent = true })
