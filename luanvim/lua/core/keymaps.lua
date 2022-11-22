vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("n", "x", '"_x')
-- keymap.set("n", "s", "<nop>")
-- keymap.set("n", "S", ":w<CR>")
keymap.set("n", "Q", ":q<CR>")
keymap.set({ "n", "v" }, "H", "5h")
keymap.set({ "n", "v" }, "J", "5j")
keymap.set({ "n", "v" }, "K", "5k")
keymap.set({ "n", "v" }, "L", "5l")

-- search
keymap.set("n", "<leader><CR>", ":nohl<CR>")
keymap.set("n", "=", "nzz")
keymap.set("n", "-", "Nzz")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- barbar
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", "<Cmd>BufferClose<CR>") -- close current tab
keymap.set("n", "<leader>tn", "<Cmd>BufferNext<CR>") -- go to next tab
keymap.set("n", "<leader>tp", "<Cmd>BufferPrevious<CR>") -- go to previous tab

keymap.set("n", "<leader>t1", "<Cmd>BufferGoto 1<CR>")
keymap.set("n", "<leader>t2", "<Cmd>BufferGoto 2<CR>")
keymap.set("n", "<leader>t3", "<Cmd>BufferGoto 3<CR>")
keymap.set("n", "<leader>t4", "<Cmd>BufferGoto 4<CR>")
keymap.set("n", "<leader>t5", "<Cmd>BufferGoto 5<CR>")
keymap.set("n", "<leader>t6", "<Cmd>BufferGoto 6<CR>")
keymap.set("n", "<leader>t7", "<Cmd>BufferGoto 7<CR>")
keymap.set("n", "<leader>t8", "<Cmd>BufferGoto 8<CR>")
keymap.set("n", "<leader>t9", "<Cmd>BufferGoto 9<CR>")
keymap.set("n", "<leader>t0", "<Cmd>BufferLast<CR>")
