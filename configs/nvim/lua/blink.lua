vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
})

vim.lsp.client.capabilities = require("blink.cmp").get_lsp_capabilities()

require("blink.cmp").setup({
	completion = { documentation = { auto_show = true } },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
