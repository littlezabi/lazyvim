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

        -- Ultra-dimmed, low-contrast dark underlines for LSP errors & warnings
        DiagnosticUnderlineError = { fg = "#582a2d", sp = "#582a2d", underline = true, undercurl = false },
        DiagnosticUnderlineWarn = { fg = "#4a3e23", sp = "#4a3e23", underline = true, undercurl = false },
        DiagnosticUnderlineInfo = { fg = "#28394a", sp = "#28394a", underline = true, undercurl = false },
        DiagnosticUnderlineHint = { fg = "#313244", sp = "#313244", underline = true, undercurl = false },
        DiagnosticUnnecessary = { fg = "#45475a", underline = false, undercurl = false },
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
