vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"zls",
	"clangd",
})

vim.diagnostic.config({ virtual_text = true })
