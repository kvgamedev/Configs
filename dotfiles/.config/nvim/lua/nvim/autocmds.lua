local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup "Text Yank",
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup "resize_splits",
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd "tabdo wincmd ="
		vim.cmd("tabnext " .. current_tab)
	end,
})
