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

  -- Configure Conform.nvim to format ONLY modified lines on save
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.rust = { "rustfmt" }
      opts.formatters_by_ft.python = { "ruff_fix", "ruff_organize_imports", "ruff_format" }
      opts.formatters_by_ft.lua = { "stylua" }
      opts.formatters_by_ft.sh = { "shfmt" }

      -- Format ONLY modified lines on save
      opts.format_on_save = function(bufnr)
        local ok, gitsigns = pcall(require, "gitsigns")
        if not ok then
          return { timeout_ms = 3000, lsp_fallback = true }
        end

        local hunks = gitsigns.get_hunks(bufnr)
        if not hunks or vim.tbl_isempty(hunks) then
          return nil
        end

        local format = require("conform").format
        for i = #hunks, 1, -1 do
          local hunk = hunks[i]
          if hunk.type ~= "delete" then
            local start_line = hunk.added.start
            local end_line = start_line + math.max(0, hunk.added.lines - 1)
            if start_line > 0 then
              format({
                bufnr = bufnr,
                async = false,
                quiet = true,
                lsp_fallback = true,
                range = {
                  start = { start_line, 0 },
                  ["end"] = { end_line, 0 },
                },
              })
            end
          end
        end
        return nil
      end

      return opts
    end,
  },
}
