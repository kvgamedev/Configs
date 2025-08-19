vim.keymap.set("t", "<c-q>", "<c-\\><c-n>", { desc = "Exit Terminal Mode" })

local M = {}
M.state = {
	terminal = {
		win = -1,
		buf = -1,
	},
	lazygit = {
		buf = -1,
		win = -1,
	},
}

M.createFloatingWin = function(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local config = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = opts.style or "minimal",
		border = opts.border or "rounded",
		title = opts.title or "Floating Window",
		title_pos = "center",
	}
	local win = vim.api.nvim_open_win(buf, true, config)

	return { buf = buf, win = win }
end

M.bottom = function()
	M.state.lazygit = M.createFloatingWin({
		buf = M.state.lazygit.buf,
		title = "Bottom System Monitor",
	})
	vim.fn.jobstart("btm", {
		term = true,
		on_exit = function()
			vim.api.nvim_win_close(M.state.lazygit.win, true)
			vim.api.nvim_buf_delete(M.state.lazygit.buf, { force = true })
			M.state.lazygit = { buf = -1, win = -1 }
		end,
	})
	vim.cmd.startinsert()
end

M.lazyGit = function()
	M.state.lazygit = M.createFloatingWin({
		buf = M.state.lazygit.buf,
		title = "LazyGit",
	})
	vim.fn.jobstart("lazygit", {
		term = true,
		on_exit = function()
			vim.api.nvim_win_close(M.state.lazygit.win, true)
			vim.api.nvim_buf_delete(M.state.lazygit.buf, { force = true })
			M.state.lazygit = { buf = -1, win = -1 }
		end,
	})
	vim.cmd.startinsert()
end

M.floatTerm = function()
	M.state.terminal = M.createFloatingWin({ buf = M.state.terminal.buf })
	if vim.bo[M.state.terminal.buf].buftype ~= "terminal" then
		vim.cmd.terminal()
		vim.keymap.set("n", "<c-q>", ":lua vim.api.nvim_win_hide(0)<cr>", { buffer = true })
	end
	vim.cmd.startinsert()
end

vim.api.nvim_create_user_command("Bottom", M.bottom, {})
vim.api.nvim_create_user_command("LazyGit", M.lazyGit, {})
vim.api.nvim_create_user_command("FloatingTerminal", M.floatTerm, {})

vim.keymap.set("n", "<c-w>b", vim.cmd.Bottom, { desc = "System Monitor (btm)" })
vim.keymap.set("n", "<c-w>g", vim.cmd.LazyGit, { desc = "LazyGit" })
vim.keymap.set("n", "<c-w>t", vim.cmd.FloatingTerminal, { desc = "Floating Terminal" })

return M
