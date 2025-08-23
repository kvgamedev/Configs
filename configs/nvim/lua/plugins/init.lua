vim.pack.add({
	"https://github.com/shortcuts/no-neck-pain.nvim",
	"https://github.com/echasnovski/mini.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/folke/flash.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/folke/which-key.nvim",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	"https://github.com/stevearc/conform.nvim",
	-- "https://github.com/folke/zen-mode.nvim", -- Doesn't play well with mini.tabline
}, { load = true, confirm = false })

local configs = require("plugins.configs")

configs.noNeckPain()
configs.mini()
configs.fzf()
configs.flash()
configs.lualine()
configs.lspconfig()
configs.treesitter()
configs.gitsigns()
configs.whichkey()
configs.blink()
configs.conform()
