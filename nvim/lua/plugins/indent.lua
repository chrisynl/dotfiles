return {
	{
		"shellRaining/hlchunk.nvim",
		init = function()
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL" })
			require("hlchunk").setup({
				chunk = {
					enable = true,
					use_treesitter = true,
					style = {
						{ fg = "#806d9c" },
					},
				},
				indent = {
					enable = false,
					chars = { "│", "¦", "┆", "┊" }, -- more code can be found in https://unicodeplus.com/
					style = {
						"#333333",
					},
				},
				blank = {
					enable = true,
				},
				line_num = {
					use_treesitter = true,
				},
			})
		end,
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	opts = {
	-- 		show_current_context = true,
	-- 		show_current_context_start = false,
	-- 	}
	-- },
}
