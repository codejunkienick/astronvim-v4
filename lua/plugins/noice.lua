return {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- REMOVE THIS once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
  opts = {
    routes = {
      {
        filter = {
          event = "notify",
          find = "Request textDocument/inlayHint failed",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          find = "Request textDocument",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          find = "vim.tbl_islist is deprecated.",
        },
        opts = { skip = true },
      },
    },
  },
}
