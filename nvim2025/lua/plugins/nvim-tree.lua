return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        api.config.mappings.default_on_attach(bufnr)  -- load defaults first

        -- remove NvimTree's default J
        vim.keymap.del('n', 'J', { buffer = bufnr })
        vim.keymap.del('n', 'K', { buffer = bufnr })

        -- re-add your mapping for the tree buffer
        vim.keymap.set('n', 'J', '5j', { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = 'Tree: down 5' })
        vim.keymap.set('n', 'K', '5k', { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = 'Tree: up 5' })
      end,
      -- 1. 自动更改根目录为当前文件所在目录
      sync_root_with_cwd = true,

      -- 2. 打开文件时自动定位并高亮当前文件
      update_focused_file = {
        enable = true,           -- 启用
        update_root = true,      -- 更新根目录为文件所在目录
        ignore_list = {},        -- 可忽略某些文件（如临时文件）
      },

      -- 3. 其他推荐配置
      view = {
        width = 30,
        side = 'left',
        adaptive_size = false,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
    })
    vim.keymap.set('n', '<leader>ee', "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
  end,
}
