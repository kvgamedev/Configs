vim.pack.add({
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/folke/tokyonight.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	"https://github.com/folke/which-key.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
})

vim.cmd("colorscheme catppuccin")

require("lualine").setup()
local wk = require("which-key")
wk.setup({
	delay = 0,
	preset = "helix",
})
wk.add({ "<leader>w", proxy = "<c-w>", desc = "Window" })
