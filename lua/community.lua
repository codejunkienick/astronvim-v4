-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.comment.ts-comments-nvim" },
  -- { import = "astrocommunity.git.git-blame-nvim" },
  -- { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.indent.mini-indentscope" },
  -- { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.lsp.lsp-lens-nvim" },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  -- { import = "astrocommunity.split-and-window.edgy-nvim" },
  -- { import = "astrocommunity.keybinding.mini-clue" },
}
