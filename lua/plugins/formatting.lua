return {
  -- Disable Indent Guides (Snacks.indent & mini.indentscope)
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },
  {
    "nvim-mini/mini.indentscope",
    enabled = false,
  },
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },

  -- Configure Conform.nvim for manual formatting only (<leader>cf)
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.python = { "ruff_format" }
      opts.formatters_by_ft.lua = { "stylua" }
      opts.formatters_by_ft.sh = { "shfmt" }

      -- Disable autoformat on save completely
      opts.format_on_save = false

      return opts
    end,
  },
}
