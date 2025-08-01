vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- Options
local o = vim.o
local opt = vim.opt

o.swapfile = false
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
o.showbreak = "󱞩 "
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
o.guicursor = "n:block-MiniStatusLineModeNormal,i:block-MiniStatusLineModeInsert,v:block-MiniStatusLineModeVisual,r:block-MiniStatusLineModeReplace,t:block-MiniStatusLineModeOther"

-- Keymaps
local map = vim.keymap.set
map({ "n", "v", "o" }, "<A-l>", "G", { desc = "Last Line" })
map({ "n", "v", "o" }, "<A-h>", "gg", { desc = "First Line" })
map({ "n", "v", "o" }, "<S-l>", "$", { desc = "Last Character" })
map({ "n", "v", "o" }, "<S-h>", "0", { desc = "First Character" })
map({ "n" }, "<Esc>", vim.cmd.nohlsearch, { desc = "Remove Search Highlights" })
map({ "n" }, "<leader>se", "<cmd>Explore<cr>", { desc = "Open Explorer" })
map({ "n" }, "<leader>o", "<cmd>source $MYVIMRC<cr>", { desc = "Source Neovim Config" })
map({ "n" }, "<leader>f", function() vim.lsp.buf.format() end, { desc = "Format Buffer" })

-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wimcd =")
		vim.cmd("tabnext" .. vim.fn.tabpagenr())
	end,
})


require("plugins")

vim.lsp.enable({ "lua_ls", "zls", "clangd" })
vim.cmd("colorscheme gruvbox")
