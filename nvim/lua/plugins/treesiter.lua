-- import nvim-treesitter plugin safely
local F = {}

F.default = function ()

  -- configure treesitter
  require("nvim-treesitter.configs").setup({
    -- enable syntax highlighting
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    -- enable indentation
    indent = { enable = true },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
      "json",
      "markdown",
      "bash",
      "lua",
      "vim",
      "c",
      "python",
      "ocaml",
    },
    -- auto install above language parsers
    auto_install = true,
  })
end

return {
  { "nvim-treesitter/nvim-treesitter" }
}
