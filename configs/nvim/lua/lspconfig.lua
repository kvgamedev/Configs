local lsp_servers = { "lua_ls", "zls", "clangd" }
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})
-- LSP
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable(lsp_servers)
