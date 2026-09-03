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

  -- Solarized Osaka Theme Configuration (craftzdog/solarized-osaka.nvim)
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- Dim UI elements to emphasize main code
        hl.LineNr = { fg = "#454b68" }
        hl.CursorLineNr = { fg = "#737aa2", bold = true }
        hl.StatusLine = { fg = "#606687", bg = "NONE" }
        hl.StatusLineNC = { fg = "#3d425c", bg = "NONE" }

        -- Clear bright Spell checking underlines
        hl.SpellBad = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false, undercurl = false }
        hl.SpellCap = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false, undercurl = false }
        hl.SpellLocal = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false, undercurl = false }
        hl.SpellRare = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false, undercurl = false }

        -- Keep code text 100% bright & readable (fg = NONE), only color the subtle underline (sp)
        hl.DiagnosticUnderlineError = { fg = "NONE", sp = "#b25555", underline = true, undercurl = false }
        hl.DiagnosticUnderlineWarn = { fg = "NONE", sp = "#c08a3e", underline = true, undercurl = false }
        hl.DiagnosticUnderlineInfo = { fg = "NONE", sp = "#4c6b8a", underline = true, undercurl = false }
        hl.DiagnosticUnderlineHint = { fg = "NONE", sp = "#565f89", underline = true, undercurl = false }
        hl.DiagnosticUnnecessary = { fg = "NONE", sp = "#c08a3e", underline = true, undercurl = false }
      end,
    },
  },

  -- Ayu Theme Configuration (Shatur/neovim-ayu)
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000,
    opts = {
      mirage = false,
      terminal = true,
    },
  },

  -- Catppuccin Configuration (Alternative theme)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },

  -- Set Solarized Osaka as default LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka", -- Options: solarized-osaka, ayu-dark, ayu-mirage, catppuccin
    },
  },
}
