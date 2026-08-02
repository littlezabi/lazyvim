return {
  -- Transparent Background Plugin
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      extra_groups = {
        "NormalFloat",
        "FloatBorder",
        "FloatTitle",
        "NvimTreeNormal",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "SnacksNormal",
        "SnacksNormalNC",
        "SnacksBackdrop",
        "LineNr",
        "CursorLineNr",
        "SignColumn",
        "StatusLine",
        "StatusLineNC",
      },
    },
  },

  -- Catppuccin Configuration
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      show_end_of_buffer = false,
      term_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        native_lsp = { enabled = true },
        noice = true,
        notify = true,
        snacks = true,
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          Normal = { bg = "NONE", ctermbg = "NONE" },
          NormalNC = { bg = "NONE", ctermbg = "NONE" },
          NormalFloat = { bg = "NONE", ctermbg = "NONE" },
          FloatBorder = { bg = "NONE", ctermbg = "NONE" },
          FloatTitle = { bg = "NONE", ctermbg = "NONE" },
          NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
          NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
          SnacksNormal = { bg = "NONE", ctermbg = "NONE" },
          SnacksNormalNC = { bg = "NONE", ctermbg = "NONE" },

          -- Ultra-dimmed, low-contrast dark underlines tailored for dark themes
          DiagnosticUnderlineError = { fg = "#582a2d", sp = "#582a2d", underline = true, undercurl = false },
          DiagnosticUnderlineWarn = { fg = "#4a3e23", sp = "#4a3e23", underline = true, undercurl = false },
          DiagnosticUnderlineInfo = { fg = "#28394a", sp = "#28394a", underline = true, undercurl = false },
          DiagnosticUnderlineHint = { fg = "#313244", sp = "#313244", underline = true, undercurl = false },
        }
      end,
    },
  },

  -- Set Catppuccin as default LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
