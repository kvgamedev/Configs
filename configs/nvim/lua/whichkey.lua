vim.pack.add({
	"https://github.com/folke/which-key.nvim"
})

local wk = require("which-key")
wk.setup({
	delay = 0,
	preset = "helix",
	show_help = false,
})
wk.add({
	{ "<leader>w", proxy = "<c-w>", desc = "Window" }
})
