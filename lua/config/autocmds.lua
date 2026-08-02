-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Ensure virtual_text is permanently turned off when LSP attaches or Neovim enters
vim.api.nvim_create_autocmd({ "VimEnter", "LspAttach" }, {
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = true,
    })
  end,
})
