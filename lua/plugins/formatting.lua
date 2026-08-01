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

  -- Format ONLY modified lines on save
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.format_on_save = function(bufnr)
        local gs_ok, gitsigns = pcall(require, "gitsigns")
        if not gs_ok then
          return
        end

        local hunks = gitsigns.get_hunks(bufnr)
        if not hunks or #hunks == 0 then
          return
        end

        local function format_hunk(i)
          local hunk = hunks[i]
          if not hunk then
            return
          end
          local start = hunk.added.start
          local count = hunk.added.count
          local last = start + count - 1
          if count == 0 then
            last = start
          end
          require("conform").format({
            bufnr = bufnr,
            async = false,
            lsp_fallback = true,
            range = {
              start = { start, 0 },
              ["end"] = { last, 0 },
            },
          }, function()
            format_hunk(i + 1)
          end)
        end
        format_hunk(1)
      end
      return opts
    end,
  },
}
