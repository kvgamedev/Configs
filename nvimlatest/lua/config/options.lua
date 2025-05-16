local o = vim.o
local opt = vim.opt
---------------------

o.confirm = true
o.timeout = true
o.timeoutlen = 300
o.inccommand = "split"
o.number = true
o.relativenumber = true
o.cursorline = true
o.showmode = false
opt.list = true
opt.listchars = { tab = "│ ", trail = "•", nbsp = "⏟" }
o.mouse = "a"
o.tabstop = 8
o.shiftwidth = 8
o.breakindent = true
o.scrolloff = 10
o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight Yanked Text",
	callback = function()
		vim.hl.on_yank()
	end,
})
