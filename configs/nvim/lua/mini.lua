vim.pack.add({
	"https://github.com/echasnovski/mini.nvim",
})

require("mini.files").setup()
vim.keymap.set("n", "<leader>e", function()
	MiniFiles.open()
end, { desc = "MiniFile" })

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

require("mini.ai").setup()
require("mini.align").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.git").setup()
require("mini.hipatterns").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.operators").setup()
