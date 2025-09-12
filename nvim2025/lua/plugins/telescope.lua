return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local tlsp = require('telescope')
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fs', function()
      builtin.current_buffer_fuzzy_find({
        winblend = 10,
        previewer = false,        -- 当前文件不需要预览
        theme = 'dropdown',       -- 更紧凑的 UI
        color_devicons = true,
        show_line_numbers = true,
        sorting_strategy = 'ascending',
      })
    end, { desc = "Search in current buffer" })

    require('telescope').setup({
      defaults = {
        -- widen preview so you need less h-scroll (optional)
        layout_strategy = 'horizontal',
        layout_config   = { width = 0.9, height = 0.88, preview_width = 0.65 },
      },
    })
  end
}
