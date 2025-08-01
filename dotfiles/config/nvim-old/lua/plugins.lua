M = {
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		keys = {
			--stylua: ignore start
			{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help" },
			{ "<leader>ss", function() Snacks.picker.grep() end, desc = "Grep" },
			{ "<leader>sf", function() Snacks.picker.files() end, desc = "Files" },
			{ "<leader>sp", function() Snacks.picker.projects() end, desc = "Projects" },
			{ "<leader>sb", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<leader>sl", function() Snacks.picker.lines() end, desc = "Lines" },
			{ "<leader>s?", function() Snacks.picker.pickers() end, desc = "Pickers" },
			{ "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands" },
			{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Word" },
			{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
			{ "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
			{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
			{ "<leader>wt", function() Snacks.terminal() end, desc = "Terminal" },
			--stylua: ignore stop
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			local wk = require("which-key")
			wk.setup({
				delay = 0,
				preset = "helix",
			})
			wk.add({
				{ "<leader>w", proxy = "<c-w>", group = "Windows" },
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = { enable = true },
			})
		end,
	},

	{ "neovim/nvim-lspconfig", lazy = false },

	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		version = false,
		config = function()
			require("mini.statusline").setup({})
			require("mini.ai").setup({})
			require("mini.surround").setup({})
			require("mini.comment").setup({})
			require("mini.pairs").setup({})
			require("mini.icons").setup({})
			MiniIcons.mock_nvim_web_devicons()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color(),
					fixme = { pattern = "FIXME", group = "MiniHipatternsFixme"},
					error = { pattern = "ERROR", group = "MiniHipatternsFixme"},
					todo = { pattern = "TODO", group = "MiniHiPatternsTodo"},
					note = { pattern = "NOTE", group = "MiniHiPatternsNote"},
				}
			})
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({ bold = false })
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua", fallback = "lsp" },
					zig = { "zigfmt" },
					cpp = { "clang-format" },
				},
			})
			vim.keymap.set({ "n" }, "<leader>f", function()
				conform.format()
			end, { desc = "Conform" })
		end,
	},

	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "VeryLazy",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = true } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = M,
	checker = { enabled = true },
	change_detection = { enabled = false, notify = false },
})
