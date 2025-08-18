vim.pack.add({
	"https://github.com/folke/flash.nvim",
})

vim.keymap.set({"n", "x", "o" }, "<return>", require("flash").jump, { desc = "Flash" })
vim.keymap.set({"n", "x", "o" }, "<s-return>", require("flash").treesitter, { desc = "Flash Treesitter" })
vim.keymap.set({ "o" }, "r", require("flash").remote, { desc = "Remote Flash" })
vim.keymap.set({ "x", "o" }, "R", require("flash").treesitter_search, { desc = "Treesitter Search" })
vim.keymap.set({"c"}, "<c-s>", require("flash").toggle, { desc = "Toggle Flash Search" })
