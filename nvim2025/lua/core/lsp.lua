-- -- Remove Global Default Key mapping
-- vim.keymap.del("n", "grn")
-- vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr") -- references
-- vim.keymap.del("n", "gri")
-- vim.keymap.del("n", "gO") 

-- Create keymapping LspAttach: After an LSP Client performs "initialize" and attaches to a buffer. 
vim.api.nvim_create_autocmd("LspAttach", { callback = function (args)

    vim.lsp.inlay_hint.enable(true, {0})

    local bufopts = { noremap = true, silent = true }
    -- vim.keymap.set("n", "grr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "grk", vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set("n", "<leader>f", function()
    --   vim.lsp.buf.format({ async = true })
    -- end, bufopts)

    -- Show diagnostics for the line under cursor (popup)
    -- vim.keymap.set('n', '<leader>e', function()
    --   vim.diagnostic.open_float(nil, { focus = true, border = 'rounded' })
    -- end, { desc = 'Line diagnostics' })

    -- Jump between diagnostics
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

    -- Optional: show diagnostics automatically when you pause on a line
    -- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
      callback = function()
        vim.diagnostic.open_float(nil, { focus = false, border = 'rounded' })
      end,
    })

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, expr = true, silent = true, desc = desc })
    end
    -- blink.cmp-powered snippet jumps (next/prev parameter)
    map({ 'i', 's' }, '<C-j>', function()
      local cmp = require('blink.cmp')
      if cmp.snippet_active() then cmp.snippet_forward(); return '' end  -- jump to next placeholder
      return '<C-j>'                                                     -- fallback to normal <C-l>
    end, 'Next placeholder')

    map({ 'i', 's' }, '<C-k>', function()
      local cmp = require('blink.cmp')
      if cmp.snippet_active() then cmp.snippet_backward(); return '' end -- jump to previous placeholder
      return '<C-k>'
    end, 'Prev placeholder')

  end
})

vim.lsp.enable({ "ty", "clangd", "hlasm" })  
