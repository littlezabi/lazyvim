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

          -- Dimmed, subtle diagnostic underlines (soft, non-distracting colors)
          DiagnosticUnderlineError = { sp = "#9e4e54", underline = true, undercurl = false },
          DiagnosticUnderlineWarn = { sp = "#8a7548", underline = true, undercurl = false },
          DiagnosticUnderlineInfo = { sp = "#4c6b8a", underline = true, undercurl = false },
          DiagnosticUnderlineHint = { sp = "#585b70", underline = true, undercurl = false },
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
