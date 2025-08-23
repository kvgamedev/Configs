local plugman = require("custom.plugin_manager")
plugman.addplug("https://github.com/ellisonleao/gruvbox.nvim")
plugman.addplug({src = "https://github.com/catppuccin/nvim", name = "catppuccin" })

require("gruvbox").setup({
	transparent_mode = true,
	bold = false,
	contrast = "hard",
})
require("catppuccin").setup({
	transparent_background = true,
})

vim.cmd("colorscheme catppuccin")
