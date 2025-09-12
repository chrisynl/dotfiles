vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set({ "n", "v" }, "x", '"_x')
keymap.set("n", "s", "<nop>")
keymap.set("n", "S", "<nop>")
keymap.set("n", "r", "<nop>")
keymap.set("n", "R", "<nop>")
keymap.set("n", "<A-w>", ":w<CR>")
keymap.set("n", "<A-q>", ":q<CR>")
keymap.set({ "n", "v" }, "H", "5h")
keymap.set({ "n", "v" }, "J", "5j")
keymap.set({ "n", "v" }, "K", "5k")
keymap.set({ "n", "v" }, "L", "5l")

-- Basic window ops
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus right window' })

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Basic tab ops
-- Create / move current window to new tab / close / keep only current
vim.keymap.set('n', '<leader>tn', '<Cmd>tabnew<CR>',        { desc = 'Tab: New' })
vim.keymap.set('n', '<leader>ts', '<Cmd>tab split<CR>',     { desc = 'Tab: Move current window to new tab' })
vim.keymap.set('n', '<leader>tq', '<Cmd>tabclose<CR>',      { desc = 'Tab: Close current' })
vim.keymap.set('n', '<leader>to', '<Cmd>tabonly<CR>',       { desc = 'Tab: Keep only current' })

-- Switch tabs
vim.keymap.set('n', '<leader>th', '<Cmd>tabprevious<CR>',   { desc = 'Tab: Previous' })
vim.keymap.set('n', '<leader>tl', '<Cmd>tabnext<CR>',       { desc = 'Tab: Next' })

-- Reorder tabs (left/right/first/last)
vim.keymap.set('n', '<leader>tH', '<Cmd>tabmove -1<CR>',    { desc = 'Tab: Move left' })
vim.keymap.set('n', '<leader>tL', '<Cmd>tabmove +1<CR>',    { desc = 'Tab: Move right' })
vim.keymap.set('n', '<leader>t0', '<Cmd>0tabmove<CR>',      { desc = 'Tab: Move to first' })
vim.keymap.set('n', '<leader>t$', '<Cmd>tabmove $<CR>',     { desc = 'Tab: Move to last' })

-- Jump to tab N (1–9)
vim.keymap.set('n', '<leader>t1', '<Cmd>tabn 1<CR>',        { desc = 'Tab: Go to 1' })
vim.keymap.set('n', '<leader>t2', '<Cmd>tabn 2<CR>',        { desc = 'Tab: Go to 2' })
vim.keymap.set('n', '<leader>t3', '<Cmd>tabn 3<CR>',        { desc = 'Tab: Go to 3' })
vim.keymap.set('n', '<leader>t4', '<Cmd>tabn 4<CR>',        { desc = 'Tab: Go to 4' })
vim.keymap.set('n', '<leader>t5', '<Cmd>tabn 5<CR>',        { desc = 'Tab: Go to 5' })
vim.keymap.set('n', '<leader>t6', '<Cmd>tabn 6<CR>',        { desc = 'Tab: Go to 6' })
vim.keymap.set('n', '<leader>t7', '<Cmd>tabn 7<CR>',        { desc = 'Tab: Go to 7' })
vim.keymap.set('n', '<leader>t8', '<Cmd>tabn 8<CR>',        { desc = 'Tab: Go to 8' })
vim.keymap.set('n', '<leader>t9', '<Cmd>tabn 9<CR>',        { desc = 'Tab: Go to 9' })

-- search
keymap.set("n", "<leader><CR>", ":nohl<CR>")
keymap.set("n", "=", "nzz")
keymap.set("n", "-", "Nzz")

-- function
-- Yank current file path (relative to :pwd) to system clipboard
vim.keymap.set('n', '<leader>yp', function()
  local path = vim.fn.expand('%')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, { desc = 'Yank file path (relative)' })

