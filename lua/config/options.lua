-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- GUI font size setting (18pt editor text)
vim.opt.guifont = "JetBrainsMono Nerd Font:h18"

-- Disable global autoformat
vim.g.autoformat = false

-- Disable spell checking on code buffers (prevents bright red SpellBad underlines on variable names)
vim.opt.spell = false

-- Disable relative line numbers, enable absolute line numbers
vim.opt.relativenumber = false
vim.opt.number = true

-- System clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Line spacing (for GUI / supported terminals)
vim.opt.linespace = 6
vim.g.neovide_linespace = 6

-- Suppress E325 ATTENTION swapfile prompts (prevents picker crashes on leftover swap files)
vim.opt.shortmess:append("A")

-- Diagnostic settings (VS Code / Zed style: underline only, no long inline text)
vim.diagnostic.config({
  virtual_text = false, -- Disables inline long trailing error text
  underline = true,    -- Keeps error/warning underlines on code
  signs = true,        -- Keeps gutter signs
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    wrap = true,
    max_width = 100,
  },
})
