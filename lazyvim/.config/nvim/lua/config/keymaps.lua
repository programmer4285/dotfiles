-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>cn", function()
  vim.cmd([[normal! viw]])
  vim.cmd([[s/\([a-z0-9]\)\([A-Z]\)/\1_\l\2/g]])
end, { desc = "Convert camelCase to snake_case" })

vim.keymap.set("n", "<leader>cN", function()
  vim.cmd([[normal! viw]])
  vim.cmd([[s/_\([a-z]\)/\u\1/g]])
end, { desc = "Convert snake_case to camelCase" })
