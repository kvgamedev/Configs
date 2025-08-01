local autocmd = vim.api.nvim_create_autocmd
autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wimcd =")
		vim.cmd("tabnext" .. vim.fn.tabpagenr())
	end,
})
