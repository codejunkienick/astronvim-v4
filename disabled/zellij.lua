return {
  "Lilja/zellij.nvim",
  lazy = false,
  config = function()
    require("zellij").setup {
      replaceVimWindowNavigationKeybinds = true,
    }
  end,
}
