vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set({ "n", "v" }, "x", '"_x')
-- keymap.set("n", "s", "<nop>")
keymap.set("n", "<A-w>", ":w<CR>")
keymap.set("n", "<A-q>", ":q<CR>")
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
keymap.set("n", "<A-o>", ":tabnew<CR>") -- open new tab
keymap.set("n", "<A-x>", "<Cmd>BufferClose<CR>") -- close current tab
keymap.set("n", "<A-j>", "<Cmd>BufferNext<CR>") -- go to next tab
keymap.set("n", "<A-k>", "<Cmd>BufferPrevious<CR>") -- go to previous tab

keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")
