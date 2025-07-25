local o = vim.o
local opt = vim.opt

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.tabstop = 4
o.shiftwidth = 4
o.showmode = false
o.scrolloff = 10
o.mouse = "nvichar"
o.list = true
o.incsearch = true
o.inccommand = "split"
o.ignorecase = true
o.smartcase = true
o.confirm = true
o.copyindent = true
o.breakindent = true
o.showbreak = "󱞩"
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.startofline = true
o.undofile = true
o.wrapmargin = 5
o.laststatus = 3
opt.listchars = { tab = "  ", trail = "" }
o.cursorline = true
o.termguicolors = true
-- o.guicursor = "i:block-MiniStatusLineModeOther"
o.guicursor =
	"n:block-MiniStatusLineModeNormal,i:block-MiniStatusLineModeInsert,v:block-MiniStatusLineModeVisual,r:block-MiniStatusLineModeReplace,t:block-MiniStatusLineModeOther"
