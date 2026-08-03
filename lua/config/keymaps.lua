-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Easy buffer closing shortcut: <leader>q closes current file/buffer without exiting Neovim
vim.keymap.set("n", "<leader>q", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer / Close File" })

-- Dynamic Font Size Adjustment Shortcuts (Zoom In / Zoom Out for GUI frontends)
local function adjust_font_size(amount)
  local font = vim.opt.guifont:get()[1]
  if font and font ~= "" then
    local name, size = font:match("([^:]+):h(%d+)")
    if name and size then
      local new_size = tonumber(size) + amount
      if new_size >= 8 and new_size <= 40 then
        vim.opt.guifont = name .. ":h" .. new_size
        vim.notify("Font size: " .. new_size, vim.log.levels.INFO)
      end
    end
  else
    vim.opt.guifont = "JetBrainsMono Nerd Font:h" .. (18 + amount)
  end
end

vim.keymap.set("n", "<C-=>", function() adjust_font_size(1) end, { desc = "Increase Font Size" })
vim.keymap.set("n", "<C-kPlus>", function() adjust_font_size(1) end, { desc = "Increase Font Size" })
vim.keymap.set("n", "<C-->", function() adjust_font_size(-1) end, { desc = "Decrease Font Size" })
