-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Easy buffer closing shortcut: <leader>q closes current file/buffer without exiting Neovim
vim.keymap.set("n", "<leader>q", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer / Close File" })
