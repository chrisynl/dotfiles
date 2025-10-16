return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local tlsp = require('telescope')
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fc', function()
      builtin.grep_string({
          preview_width = 0.62,
          preview_cutoff = 0,   -- <== 关键：此布局下永不自动隐藏预览
      })
    end, { desc = 'Telescope [F]ind [C]urrent cursor string' })
    vim.keymap.set('n', '<leader>fb', function() 
      builtin.buffers({
        sort_lastused = true,
        only_cwd = true,              
        sort_mru = true,              
      })
    end, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

    vim.keymap.set('n', '<leader>fic', builtin.lsp_incoming_calls, { desc = 'Lists LSP incoming calls for word under the cursor' })
    vim.keymap.set('n', '<leader>foc', builtin.lsp_outgoing_calls, { desc = 'Lists LSP outgoing calls for word under the cursor' })
    vim.keymap.set('n', '<leader>fds', builtin.lsp_document_symbols, { desc = '[F]ind LSP [D]ocument [S]ymbols in the current buffer' })
    vim.keymap.set('n', '<leader>fws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', { desc = '[F]ind [W]orkspace [S]ymbols' })
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = '[F]ind [R]eferences' })

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

    vim.keymap.set('n', '<leader>fj', function()
      builtin.jumplist({
        fname_width = 50, 
      })
    end, { desc = "Telescop jumplist" })

    require('telescope').setup({
      defaults = {
        -- widen preview so you need less h-scroll (optional)
        -- layout_strategy = 'horizontal',
        -- layout_config   = { width = 0.9, height = 0.88, preview_width = 0.65 },
        preview_cutoff = 1000,
        layout_strategy = 'vertical',
        layout_config   = { width = 0.9, height = 0.98, preview_height = 0.65},
        mappings = {
          i = {
            ["<C-Down>"] = require('telescope.actions').cycle_history_next,
            ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
          },
        },
      },
    })
  end
}
