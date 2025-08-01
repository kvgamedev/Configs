vim.pack.add({
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/folke/which-key.nvim"
})

require("gruvbox").setup({ bold = false , contrast = "hard" })
-- require("tokyonight").setup({transparent = false})

vim.cmd("colorscheme gruvbox")
require("which-key").setup({
	delay = 0,
	preset = "helix",
})
