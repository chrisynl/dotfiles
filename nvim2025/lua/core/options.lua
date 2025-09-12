local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentations
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- serch settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- word set
opt.iskeyword:append("-")

-- scrolloff
opt.scrolloff = 5

-- modeline
opt.modeline = false

-- updatetime
vim.o.updatetime = 300
