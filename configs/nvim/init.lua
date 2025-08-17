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
	require("treesitter")
	require("float_term")
	require("blink")
	require("whichkey")
	require("format")
	require("statusline")
end, 0)
