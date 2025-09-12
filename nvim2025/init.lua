if vim.g.vscode then
  require("core.options")
  require("core.keymaps")
else
  require("core.options")
  require("plugins-setup")
  require("core.lsp")
  require("core.keymaps")
end
