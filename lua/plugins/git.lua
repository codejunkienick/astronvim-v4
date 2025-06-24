---@type LazySpec
return {
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    opts = {},
    dependencies = {
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              ["<Leader>gV"] = {
                "<cmd>BlameToggle virtual<cr>",
                desc = "Toggle git blame text",
              },
              ["<Leader>gB"] = {
                "<cmd>BlameToggle window<cr>",
                desc = "Toggle git blame window",
              },
            },
          },
        },
      },
      { "AstroNvim/astroui", opts = { status = { winbar = { enabled = { filetype = { "blame" } } } } } },
    },
  },
}
