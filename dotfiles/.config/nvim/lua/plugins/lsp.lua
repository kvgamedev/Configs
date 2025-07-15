return {
	{
	    "mason-org/mason-lspconfig.nvim",
	    event = "VeryLazy",
	    opts = {},
	    dependencies = {
	        { "mason-org/mason.nvim", opts = {} },
	        "neovim/nvim-lspconfig",
	    },
	},

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
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup {
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
				},
			}

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format { bufnr = args.buf }
				end,
			})
		end,
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
			appearance = {
				nerd_font_variant = "mono",
			},
			snippets = { preset = "luasnip" },
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
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
}
