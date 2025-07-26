local configs = require "plugins/configs"

return {

	--stylua: ignore start
	{ "stevearc/conform.nvim", opts = {}, event = "VeryLazy", config = configs.conform, },
	{ "folke/lazydev.nvim", ft = "lua", opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } }, }, }, },
	{ "catppuccin/nvim", priority = 1000, name = "catppuccin", config = configs.catppuccin, },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, opts = ..., config = configs.gruvbox, },
	{ "folke/noice.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim" }, opts = {}, config = configs.noice, },
	{ "lewis6991/gitsigns.nvim", opts = {}, event = "VeryLazy", config = configs.gitsigns, },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {}, config = configs.whichkey, },
	{ "echasnovski/mini.nvim", version = "*", config = configs.mini },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {transparent = true}, },
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000, opts = {transparent = true}, },
	--stylua: ignore end

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		depdendencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter-context",
		},
	},

	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		version = "v2.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").load()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = configs.lsp(),
	},

	{
		"saghen/blink.cmp",
		event = "VeryLazy",
		dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			appearance = { nerd_font_variant = "mono" },
			snippets = { preset = "luasnip" },
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			explorer = { enabled = false },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			picker = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			styles = {
				notification = {
					wo = { wrap = true },
				},
			},
		},

		--stylua: ignore start
		keys = {
			-- find
			{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers", },
			{ "<leader>ff", function() Snacks.picker.files() end, desc = "Files", },
			{ "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files", },
			{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects", },
			{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent", },

			-- git
			{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
			{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
			{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log", },
			{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line", },
			{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status", },
			{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash", },
			{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)", },
			{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File", },

			-- Grep
			{ "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", },
			{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep", },
			{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" }, },

			-- search
			{ "<leader>s?", function() Snacks.picker.pickers() end, desc = "Pickers", },
			{ "<leader>sf", function() Snacks.picker.files() end, desc = "Files", },
			{ "<leader>ss", function() Snacks.picker.smart() end, desc = "Smart Find Files", },
			{ "<leader>sr", function() Snacks.picker.registers() end, desc = "Registers", },
			{ "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History", },
			{ "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds", },
			{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
			{ "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands", },
			{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics", },
			{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics", },
			{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", },
			{ "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps", },
			{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
			{ "<leader>sll", function() Snacks.picker.loclist() end, desc = "Location List", },
			{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks", },
			{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List", },
			{ "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume", },
			{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History", },
			{ "<leader>sC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", },

			-- LSP
			{ "gld", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
			{ "glD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration", },
			{ "glr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
			{ "glI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
			{ "gly", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition", },
			{ "<leader>sls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
			{ "<leader>slS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },

			-- Other
			{ "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
			{ "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom", },
			{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
			{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
			{ "<leader>sn", function() Snacks.notifier.show_history() end, desc = "Notification History", },
			{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
			{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", },
			{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" }, },
			{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
			{ "<leader>wt", function() Snacks.terminal() end, desc = "Toggle Terminal", },
			{ "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" }, },
			{ "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" }, },
		},

		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd

					Snacks.toggle.diagnostics():map "<leader>ud"
					Snacks.toggle .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, }) :map "<leader>uc"
					Snacks.toggle.inlay_hints():map "<leader>uh"
					Snacks.toggle.indent():map "<leader>ug"
					Snacks.toggle.dim():map "<leader>uD"
				end,
			})
		end,
		--stylua: ignore end
	},

	-- {
	-- 	"stevearc/oil.nvim",
	-- 	---@module 'oil'
	-- 	---@type oil.SetupOpts
	-- 	opts = {},
	-- 	dependencies = "echasnovski/mini.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("oil").setup()
	-- 		vim.keymap.set(
	-- 			"n",
	-- 			"<leader>e",
	-- 			"<Cmd>Oil<cr>",
	-- 			{ desc = "Open Oil Explorer" }
	-- 		)
	-- 	end,
	-- },
}
