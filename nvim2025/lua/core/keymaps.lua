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
