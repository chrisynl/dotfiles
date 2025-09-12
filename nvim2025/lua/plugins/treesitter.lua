return {
  "nvim-treesitter/nvim-treesitter", 
  branch = 'master', 
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { "c", "lua", "vim", "vimdoc", "regex", "bash"},
      highlight = {
        enable = true,
      },
      indent = { enable = true},
      autotag = { enable = true},
    })
  end
}
