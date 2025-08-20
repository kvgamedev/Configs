vim.pack.add({
	"https://github.com/echasnovski/mini.nvim",
})

require("mini.files").setup()
vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "MiniFile" })

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

require("mini.ai").setup()
require("mini.align").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.notify").setup()
require("mini.operators").setup()
require("mini.bracketed").setup()

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
