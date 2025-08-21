vim.pack.add({
	"https://github.com/folke/zen-mode.nvim",
})

vim.cmd("ZenMode")
vim.keymap.set("n", "<leader>z", vim.cmd.ZenMode, { desc = "Zen Mode" })
