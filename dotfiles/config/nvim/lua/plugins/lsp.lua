vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/saghen/blink.cmp",
})
local servers = {
	"lua_ls",
	"zls",
	"clangd",
}

for _, server in ipairs(servers) do
	require("lspconfig")[server].setup({
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	})
end
vim.lsp.enable(servers)

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = true },
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		zig = { "zigfmt" },
		cpp = { "clang-format" },
	},
})
vim.keymap.set("n", "glf", function()
	require("conform").format()
end, { desc = "Format" })

require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
		menu = {
			border = "rounded",
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "lua" },
})
