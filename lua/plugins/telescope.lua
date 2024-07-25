-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts) require("telescope").setup(opts) end,
    opts = function(_, config)
      -- local telescope_actions = require "telescope.actions"
      config.pickers = {
        lsp_definitions = {
          file_ignore_patterns = { "react/index.d.ts" },
        },
      }
      -- config.defaults.mappings.n["<C-q>"] = telescope_actions.close
      -- config.defaults.mappings.n["d"] = telescope_actions.delete_buffer
      -- config.defaults.mappings.i["<C-q>"] = telescope_actions.close
      return config
    end,
  },
}
