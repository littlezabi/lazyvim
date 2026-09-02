return {
  -- Fast, Smooth Physics-Based Scrolling Animation (Zed Style)
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing = "quadratic",
      duration_multiplier = 0.4, -- 40% duration for ultra-fast, snappy Zed-style smooth scrolling
    },
  },

  -- Animated Fluid Cursor Motion Trail (Zed Style Motion Animation)
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      scroll_buffer_space = true,
      legacy_computing_symbols_support = false,
      stiffness = 0.8, -- Fast, responsive cursor snap
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
    },
  },
}
