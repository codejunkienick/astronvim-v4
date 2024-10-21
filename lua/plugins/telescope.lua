-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  --   {
  --     "nvim-telescope/telescope-frecency.nvim",
  --     config = function() require("telescope").load_extension "frecency" end,
  --   },
  --   {
  --     "AstroNvim/astrocore",
  --     ---@param opts AstroCoreOpts
  --     opts = function(_, opts)
  --       return require("astrocore").extend_tbl(opts, {
  --         mappings = {
  --           n = {
  --             ["<Leader>fj"] = {
  --               desc = "Frequent Files",
  --               function() vim.cmd "Telescope frecency workspace=CWD  previewer=false theme=ivy" end,
  --             },
  --           },
  --         },
  --       })
  --     end,
  --   },
  {
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts) require("telescope").setup(opts) end,
    opts = function(_, config)
      -- local telescope_actions = require "telescope.actions"
      config.pickers = {
        find_files = {
          theme = "ivy",
          dynamic_preview_title = true,
          path_display = {
            shorten = { len = 4, exclude = { -1, -2, 1 } },
          },
        },
        lsp_definitions = {
          file_ignore_patterns = { "react/index.d.ts" },
        },
      }
      config.defaults.dynamic_preview_title = true

      return config
    end,
  },
}
