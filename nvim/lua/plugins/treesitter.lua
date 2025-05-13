return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = "TSUpdate",
		opts = {
			ensure_installed = { "c" },
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup()
		end,
	},
}
