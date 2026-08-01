return {
  -- Disable Indent Guides (Snacks.indent & mini.indentscope)
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },

  -- Configure Conform.nvim for Python (ruff_format) and modified line formatting on save
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.python = { "ruff_format" }
      opts.formatters_by_ft.lua = { "stylua" }
      opts.formatters_by_ft.sh = { "shfmt" }

      opts.format_on_save = function(bufnr)
        -- Check if gitsigns has modified hunks
        local gs_ok, gitsigns = pcall(require, "gitsigns")
        if gs_ok then
          local hunks = gitsigns.get_hunks(bufnr)
          if hunks and #hunks > 0 then
            for _, hunk in ipairs(hunks) do
              if hunk.type ~= "delete" then
                local start_line = hunk.added.start
                local end_line = start_line + math.max(0, hunk.added.count - 1)
                if hunk.added.count == 0 then
                  end_line = start_line
                end
                return {
                  timeout_ms = 1000,
                  lsp_fallback = true,
                  range = {
                    start = { start_line, 0 },
                    ["end"] = { end_line, 0 },
                  },
                }
              end
            end
          end
        end

        -- Fallback: Format current file on save
        return {
          timeout_ms = 1000,
          lsp_fallback = true,
        }
      end

      return opts
    end,
  },
}
