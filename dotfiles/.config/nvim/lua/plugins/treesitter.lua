return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = "nvim-treesitter/nvim-treesitter-context",
		build = ":TSUpdate",
		opts = {
		},
		config = function()
			require('nvim-treesitter.configs').setup {
				auto_install = true,
				highlight = { enabled = true, },
				indent = { enabled = true, },
			}
		end
	}
}
