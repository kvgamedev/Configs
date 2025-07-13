local o = vim.o
local opt = vim.opt

o.confirm = true
o.timeout = true
o.timeoutlen = 300
o.inccommand = "split"
o.number = true
o.relativenumber = true
o.cursorline = true

o.termguicolors = true
o.guicursor = "n:block-MiniStatuslineModeNormal,i:block-MiniStatusLineModeInsert,r:block-MiniStatusLineModeReplace,v:block-MiniStatuslineModeVisual"

o.showmode = false
o.mouse = "a"
o.tabstop = 4
o.shiftwidth = 4
o.breakindent = true
o.scrolloff = 15
o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"
o.colorcolumn = '100'
o.splitbelow = true
o.splitright = true
o.list = true
opt.listchars = { tab = '  ', trail = '', nbsp = "󱁐" }

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	desc = "Highlight Yanked Text",
	callback = function()
		vim.hl.on_yank()
	end,
})
