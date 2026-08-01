-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- System clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Line spacing (for GUI / supported terminals)
vim.opt.linespace = 6
vim.g.neovide_linespace = 6

-- Suppress E325 ATTENTION swapfile prompts (prevents picker crashes on leftover swap files)
vim.opt.shortmess:append("A")

-- Diagnostic float settings (wrap long error/warning messages)
vim.diagnostic.config({
  float = {
    wrap = true,
    border = "rounded",
    max_width = 100,
  },
})
