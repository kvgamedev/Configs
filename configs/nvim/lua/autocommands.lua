vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wimcd =")
		vim.cmd("tabnext" .. vim.fn.tabpagenr())
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	once = true,
	callback = function()
		--stylua: ignore start
		vim.keymap.set("n", "gld", function() vim.lsp.buf.definition() end, { desc = "Goto Definition" })
		vim.keymap.set("n", "gli", function() vim.lsp.buf.implementation() end, { desc = "Goto Implementation" })
		vim.keymap.set("n", "glt", function() vim.lsp.buf.type_definition() end, { desc = "Goto Type Definition" })
		vim.keymap.set("n", "gln", function() vim.lsp.buf.rename() end, { desc = "Rename" })
		vim.keymap.set("n", "gla", function() vim.lsp.buf.code_action() end, { desc = "Code Actions" })
		--stylua: ignore stop
	end,
})
