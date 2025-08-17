vim.g.mapleader = " "
vim.g.localmapleader = " "

require("options")
require("plugins.colorscheme")

vim.defer_fn(function()
	require("keymaps")
	require("autocommands")

	require("plugins.fzf")
	require("plugins.mini")
	require("plugins.lspconfig")
	require("plugins.statusline")
	require("plugins.treesitter")
	require("custom.float_term")
	require("plugins.whichkey")
	require("plugins.gitsigns")
	require("plugins.blink")
	require("plugins.conform")
end, 0)
