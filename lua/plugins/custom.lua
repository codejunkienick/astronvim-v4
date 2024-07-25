-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- == Examples of Adding Plugins ==
  {
    "max397574/better-escape.nvim",
    config = function() require("better_escape").setup() end,
  },
  -- Replaced with edgy-nvim
  -- {
  --   "nvim-focus/focus.nvim",
  --   lazy = false,
  --   config = function()
  --     require("focus").setup {
  --       enable = true,
  --       commads = true,
  --     }
  --   end,
  -- },
  {
    "Lilja/zellij.nvim",
    lazy = false,
    config = function()
      require("zellij").setup {
        replaceVimWindowNavigationKeybinds = true,
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
