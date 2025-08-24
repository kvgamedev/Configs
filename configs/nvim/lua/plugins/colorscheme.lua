local plugman = require("custom.plugin_manager")

plugman.addplug({
	src = "https://github.com/ellisonleao/gruvbox.nvim",
	post_hook = function()
		require("gruvbox").setup({
			transparent_mode = true,
			bold = false,
			contrast = "hard",
		})
	end,
})

plugman.addplug({
	src = "https://github.com/catppuccin/nvim",
	name = "catppuccin",
	post_hook = function()
		require("catppuccin").setup({
			transparent_background = true,
		})
	end,
})

vim.cmd("colorscheme catppuccin")
