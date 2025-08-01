vim.pack.add({
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
})

vim.cmd("colorscheme catppuccin")

local wk = require("which-key")
wk.setup({
	delay = 0,
	preset = "helix",
})
wk.add({ "<leader>w", proxy = "<c-w>", desc = "Window" })
wk.add({ "gl", proxy = "gr", desc = "LSP" })
