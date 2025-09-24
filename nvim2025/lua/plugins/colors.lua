local function enable_transparency()
  vim.api.nvim_set_hl(0, "Normal", {bg = None})
end

return {
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-macchiato"
      -- enable_transparency()
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    -- config = function()
    --   vim.cmd.colorscheme "tokyonight-night"
    --   -- enable_transparency()
    -- end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- theme = 'tokyonight-night',
      theme = 'catppuccin-macchiato',
      sections = {
        lualine_c = {
          { 'filename',
            path = 1,               -- <== relative path
            file_status = true,     -- [+] modified, [-] readonly
            newfile_status = true,  -- [New]
            shorting_target = 40,   -- shorten left parts when too long
            symbols = { modified = '●', readonly = '', unnamed = '[No Name]', newfile = '[New]' },
          },
        },
      }
    }
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup({
        options = {
          mode = 'tabs',                 -- 显示 Vim Tabs（不是 buffers）
          numbers = 'ordinal',           -- 显示 1..9 序号
          separator_style = 'slant',     -- 'slant' | 'thick' | 'thin'
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = true,
          diagnostics = 'nvim_lsp',      -- 在 tab 上显示诊断气泡
          -- 如果你用 nvim-tree，给它留个偏移标题（可选）
          offsets = {
            { filetype = 'NvimTree', text = 'File Explorer', highlight = 'Directory', separator = true },
          },
        },
      })
    end,
  }

}
