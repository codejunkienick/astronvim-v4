-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- {
  --   "chrisgrieser/cmp_yanky",
  --   opt = {
  --     -- only suggest items which match the current filetype
  --     onlyCurrentFiletype = false,
  --     -- only suggest items with a minimum length
  --     minLength = 3,
  --   },
  -- },
  {
    "Exafunction/codeium.nvim",
    commit = "937667b2cadc7905e6b9ba18ecf84694cf227567",
    lazy = false,
    cmd = "Codeium",
    opts = {
      enable_chat = true,
    },
    dependencies = {
      {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = {
          icons = {
            Codeium = "",
          },
        },
      },
      {
        "AstroNvim/astrocore",
        ---@param opts AstroCoreOpts
        opts = function(_, opts)
          return require("astrocore").extend_tbl(opts, {
            mappings = {
              n = {
                ["<Leader>;"] = {
                  desc = require("astroui").get_icon("Codeium", 1, true) .. "Codeium",
                },
                ["<Leader>;o"] = {
                  desc = "Open Chat",
                  function() vim.cmd "Codeium Chat" end,
                },
              },
            },
          })
        end,
      },
    },
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
    },
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        -- { name = "cmp_yanky", priority = 650 },
        {
          name = "codeium",
          priority = 1100,
        },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "emoji", priority = 700 }, -- add new source
      }
    end,
  },
}
