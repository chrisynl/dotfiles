return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
          })
        end,
      })
      require("mason-lspconfig").setup {
          ensure_installed = {
            "lua_ls",
            "clangd",
            -- "sourcery",
            -- "pyright",
            -- "ocamllsp",
          },
      }
    end
  },
}
