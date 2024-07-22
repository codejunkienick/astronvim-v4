-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- == Examples of Adding Plugins ==
  {
    "max397574/better-escape.nvim",
    config = function() require("better_escape").setup() end,
  },
  {
    "nvim-focus/focus.nvim",
    lazy = false,
    config = function()
      require("focus").setup {
        enable = true,
        commads = true,
      }
    end,
    {
      "Lilja/zellij.nvim",
      lazy = false,
      config = function()
        require("zellij").setup {
          replaceVimWindowNavigationKeybinds = true,
        }
      end,
    },
    -- {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   opts = function(_, config)
    --     local null_ls = require "null-ls"
    --     config.sources = {
    --       null_ls.builtins.formatting.stylua,
    --       null_ls.builtins.formatting.prettierd,
    --       -- null_ls.builtins.formatting.eslint_d,
    --       null_ls.builtins.diagnostics.eslint_d,
    --       null_ls.builtins.code_actions.eslint_d,
    --       null_ls.builtins.diagnostics.markdownlint,
    --     }
    --
    --     return config
    --   end,
    -- },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = function(_, config)
        config.close_if_last_window = false
        return config
      end,
    },
    {
      "onsails/lspkind.nvim",
      opts = function(_, config)
        config.mode = "text_symbol"
        return config
      end,
    },
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    dependencies = {
      "tpope/vim-repeat",
    },
  },
}
