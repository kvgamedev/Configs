return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = { },
		config = function()
			require('tokyonight').setup{
				transparent = true,
			}
			vim.cmd[[colorscheme gruvbox]]
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000 ,
		config = true,
		opts = {},
	}
}
