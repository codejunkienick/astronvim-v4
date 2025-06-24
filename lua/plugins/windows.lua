-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- == Examples of Adding Plugins ==
  {
    "nvim-focus/focus.nvim",
    lazy = false,
    config = function()
      require("focus").setup {
        enable = true,
        commads = true,
        autoresize = { minwidth = 15, minheight = 15 },
        ui = {
          number = true,
        },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, config)
      config.close_if_last_window = false
      return config
    end,
  },
}
