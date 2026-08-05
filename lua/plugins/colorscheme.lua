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

  -- Ayu Theme Configuration (Shatur/neovim-ayu)
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000,
    opts = {
      mirage = false, -- set true for ayu-mirage, false for ayu-dark
      terminal = true,
      overrides = {
        Normal = { bg = "NONE", ctermbg = "NONE" },
        NormalNC = { bg = "NONE", ctermbg = "NONE" },
        NormalFloat = { bg = "NONE", ctermbg = "NONE" },
        FloatBorder = { bg = "NONE", ctermbg = "NONE" },
        FloatTitle = { bg = "NONE", ctermbg = "NONE" },
        NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
        SnacksNormal = { bg = "NONE", ctermbg = "NONE" },
        SnacksNormalNC = { bg = "NONE", ctermbg = "NONE" },

        -- Dim UI elements (line numbers, statusline, sidebars) to emphasize main code
        LineNr = { fg = "#454b68" },
        CursorLineNr = { fg = "#737aa2", bold = true },
        StatusLine = { fg = "#606687", bg = "NONE" },
        StatusLineNC = { fg = "#3d425c", bg = "NONE" },

        -- Clear bright Spell checking underlines
        SpellBad = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false, undercurl = false },
        SpellCap = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false, undercurl = false },
        SpellLocal = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false, undercurl = false },
        SpellRare = { fg = "NONE", bg = "NONE", sp = "NONE", underline = false, undercurl = false },

        -- Keep code text 100% bright & readable (fg = NONE), only color the subtle underline (sp)
        DiagnosticUnderlineError = { fg = "NONE", sp = "#b25555", underline = true, undercurl = false },
        DiagnosticUnderlineWarn = { fg = "NONE", sp = "#c08a3e", underline = true, undercurl = false },
        DiagnosticUnderlineInfo = { fg = "NONE", sp = "#4c6b8a", underline = true, undercurl = false },
        DiagnosticUnderlineHint = { fg = "NONE", sp = "#565f89", underline = true, undercurl = false },
        DiagnosticUnnecessary = { fg = "NONE", sp = "#c08a3e", underline = true, undercurl = false },
      },
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

  -- Set Ayu Dark as default LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-dark", -- Options: ayu-dark, ayu-mirage, ayu-light, catppuccin
    },
  },
}
