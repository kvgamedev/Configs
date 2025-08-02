vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/stevearc/conform.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

local servers = {
	"lua_ls",
	"zls",
	"clangd",
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.client.capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.enable(servers)

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = true },
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
		menu = { border = "rounded" },
	},
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		zig = { "zigfmt" },
		cpp = { "clang-format" },
	},
})
vim.keymap.set("n", "glf", function() require("conform").format() end, { desc = "Format" })
