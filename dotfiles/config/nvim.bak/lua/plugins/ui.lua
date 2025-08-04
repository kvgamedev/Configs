vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/folke/which-key.nvim",
})

vim.cmd("colorscheme catppuccin")

local wk = require("which-key")
wk.setup({
	delay = 0,
	preset = "helix",
})
wk.add({ "<leader>w", proxy = "<c-w>", desc = "Window" })
