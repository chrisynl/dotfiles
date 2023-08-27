require("lazy").setup({
  require("plugins.colorscheme"),
  require("plugins.which-key"),
  require("plugins.neo-tree"),
  { "nvim-tree/nvim-web-devicons", lazy = true },
  require("plugins.lua-line"),
  require("plugins.lsp.mason"),
  require("plugins.lsp.lspconfig"),
  require("plugins.lsp.lspsaga"),
  require("plugins.nvim-cmp"),
  --require("plugins.lsp.lspzero"),
  require("plugins.treesiter"),
})
