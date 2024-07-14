return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		init = function()
			require("hlchunk").setup({
				blank = {
					enable = true,
					chars = {
						" ",
					},
					style = {
						{ bg = "#434437" },
						{ bg = "#2f4440" },
						{ bg = "#433054" },
						{ bg = "#284251" },
					},
				},
				chunk = {
					enable = false,
					use_treesitter = true,
					style = {
						{ fg = "#806d9c" },
					},
				},
				indent = {
					enable = true,
					chars = { "│", "¦", "┆", "┊" }, -- more code can be found in https://unicodeplus.com/
					style = {
						"#333333",
					},
				},
				line_num = {
					use_treesitter = true,
				},
			})
		end,
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	event = { "UIEnter" },
	-- 	ops = {},
	-- 	init = function()
	-- 		require("ibl").setup()
	-- 	end,
	-- },
}
