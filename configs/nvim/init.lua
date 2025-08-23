vim.g.mapleader = " "
vim.g.localmapleader = " "

require("options")
require("plugins.colorscheme")

vim.defer_fn(function()
	require("keymaps")
	require("autocommands")

	require("plugins")
	require("custom.float_term")
end, 0)
