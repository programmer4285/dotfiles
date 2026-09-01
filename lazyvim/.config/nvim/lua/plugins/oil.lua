return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false,
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory (oil)" },
    -- { "<leader>e", "<cmd>Oil<cr>", desc = "Open parent directory (oil)" },
  },
}
