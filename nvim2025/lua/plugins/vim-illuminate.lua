return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      delay = 150,
      filetypes_denylist = { 'NvimTree', 'TelescopePrompt' },
      providers = { 'lsp', 'treesitter', 'regex' },
    })
  end,
}

