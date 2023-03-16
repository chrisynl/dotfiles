-- local gruvbox = require("gruvbox")
-- -- setup must be called before loading the colorscheme
-- -- Default options:
-- gruvbox.setup({
-- 	undercurl = true,
-- 	underline = true,
-- 	bold = false,
-- 	italic = true, -- make italic comments and special strings
-- 	strikethrough = true,
-- 	invert_selection = false,
-- 	invert_signs = false,
-- 	invert_tabline = false,
-- 	invert_intend_guides = false,
-- 	inverse = true, -- invert background for search, diffs, statuslines and errors
-- 	contrast = "hard", -- can be "hard", "soft" or empty string
-- 	palette_overrides = {},
-- 	overrides = {},
-- 	dim_inactive = false,
-- 	transparent_mode = false,
-- })

-- vim.cmd("colorscheme gruvbox")

--
-- deus colorstheme
--
vim.cmd([[
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
]])
