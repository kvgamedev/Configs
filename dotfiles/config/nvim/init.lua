vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({
	"https://github.com/folke/lazy.nvim",
})

local o = vim.o
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

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
o.cmdheight = 0
o.listchars = "tab:  ,trail:"
o.cursorline = true
o.termguicolors = true
o.guicursor =
	"n:block-MiniStatusLineModeNormal,i:block-MiniStatusLineModeInsert,v:block-MiniStatusLineModeVisual,r:block-MiniStatusLineModeReplace,t:block-MiniStatusLineModeOther"

map({ "n", "v", "o" }, "<A-l>", "G", { desc = "Last Line" })
map({ "n", "v", "o" }, "<A-h>", "gg", { desc = "First Line" })
map({ "n", "v", "o" }, "<S-l>", "$", { desc = "Last Character" })
map({ "n", "v", "o" }, "<S-h>", "0", { desc = "First Character" })
map({ "n" }, "<Esc>", function()
	vim.cmd("nohlsearch")
end, { desc = "Remove Search Highlights" })

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

autocmd("LspAttach", {
	callback = function()
		vim.keymap.set("n", "gld", function()
			vim.lsp.buf.definition()
		end, { desc = "Goto Definition" })
		vim.keymap.set("n", "gli", function()
			vim.lsp.buf.implementation()
		end, { desc = "Goto Implementation" })
		vim.keymap.set("n", "glt", function()
			vim.lsp.buf.type_definition()
		end, { desc = "Goto Type Definition" })
		vim.keymap.set("n", "gln", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename" })
		vim.keymap.set("n", "gla", function()
			vim.lsp.buf.code_action()
		end, { desc = "Code Actions" })
	end,
})

local plugins = {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({
				delay = 0,
				preset = "helix",
			})
		end,
	},

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			local fzf = require("fzf-lua")
			fzf.setup()
			fzf.register_ui_select()
			-- stylua: ignore start
			map("n", "<leader>sh", function() fzf.help_tags() end, { desc = "Help" })
			map("n", "<leader>/", function() fzf.live_grep() end, { desc = "Grep" })
			map("n", "<leader>f", function() fzf.files() end, { desc = "Files" })
			map("n", "<leader>s.", function() fzf.resume() end, { desc = "Resume" })
			map("n", "<leader>so", function() fzf.oldfiles() end, { desc = "Old Files" })
			map("n", "<leader>sb", function() fzf.buffers() end, { desc = "Buffers" })
			map("n", "<leader>s/", function() fzf.lines() end, { desc = "Lines" })
			map("n", "<leader>s?", function() fzf.builtin() end, { desc = "Pickers" })
			map("n", "<leader>sc", function() fzf.commands() end, { desc = "Commands" })
			map("n", "<leader>sC", function() fzf.command_history() end, { desc = "Command History" })
			map("n", "<leader>sw", function() fzf.grep_cword() end, { desc = "Word" })
			map("n", "<leader>ss", function() fzf.search_history() end, { desc = "Search History" })
			map("n", "<leader>sk", function() fzf.keymaps() end, { desc = "Keymaps" })
			map("n", "<leader>sm", function() fzf.marks() end, { desc = "Marks" })
			map("n", "<leader>sz", function() fzf.zoxide() end, { desc = "Zoxide" })
			-- Lsp
			map("n", "<leader>ld", function() fzf.lsp_document_diagnostics() end, { desc = "Diagnostics" })
			map("n", "<leader>la", function() fzf.lsp_code_actions() end, { desc = "LSP Actions" })
			map("n", "<leader>lr", function() fzf.lsp_references() end, { desc = "References" })
			map("n", "<leader>li", function() fzf.lsp_implementations() end, { desc = "Implmentations" })
			map("n", "<leader>ls", function() fzf.lsp_workspace_symbols() end, { desc = "Workspace Symbols" })
			-- stylua: ignore stop
		end,
	},

	{ "lewis6991/gitsigns.nvim", event = "VeryLazy", opts = {} },
	{ "folke/tokyonight.nvim", opts = {} },
	{ "catppuccin/nvim", name = "catppuccin", opts = {} },
	{ "neovim/nvim-lspconfig", config = function() end },

	{
		"Saghen/blink.cmp",
		event = "VeryLazy",
		version = "1.*",
		---@module 'blink.Cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					zig = { "zigfmt" },
				},
			})
			map("n", "glf", function()
				require("conform").format()
			end, { desc = "Format" })
		end,
	},

	{ "folke/noice.nvim", opts = {} },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
			map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" })
		end,
	},
}
require("lazy").setup({
	spec = plugins,
})
vim.lsp.enable({ "lua_ls", "zls" })
vim.cmd("colorscheme catppuccin")
