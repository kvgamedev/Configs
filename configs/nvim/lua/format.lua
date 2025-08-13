vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		zig = { "zigfmt" },
		cpp = { "clang-format" },
	},
})
vim.keymap.set("n", "glf", function()
	require("conform").format()
end, { desc = "Format Buffer" })
