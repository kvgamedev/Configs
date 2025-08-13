vim.g.mapleader = " "
vim.g.localmapleader = " "

require("options")
require("colorscheme")

vim.defer_fn(function()
	require("keymaps")
	require("autocommands")

	require("mini")
	require("fzf")
	require("lspconfig")
	require("blink")
	require("treesitter")
	require("format")
	require("floatingWin")
end, 0)
