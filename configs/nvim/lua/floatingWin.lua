vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit Terminal Mode" })

local state = {
	terminal = {
		win = -1,
		buf = -1,
	},
	lazygit = {
		buf = -1,
		win = -1,
	},
}

local function createFloatingWindow(opts)
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

vim.api.nvim_create_user_command("LazyGit", function()
	state.lazygit = createFloatingWindow({ buf = state.lazygit.buf, title = "LazyGit" })
	vim.fn.jobstart("lazygit", {
		term = true,
		on_exit = function()
			vim.api.nvim_win_close(state.lazygit.win, true)
			vim.api.nvim_buf_delete(state.lazygit.buf, { force = true })
		end,
	})
	vim.cmd.startinsert()
end, {})
vim.keymap.set("n", "<leader>wg", function() vim.cmd.LazyGit() end, { desc = "Lazygit" })

vim.api.nvim_create_user_command("FloatingTerminal", function()
	if not vim.api.nvim_win_is_valid(state.terminal.win) then
		state.terminal = createFloatingWindow({ buf = state.terminal.buf })
		if vim.bo[state.terminal.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
		vim.cmd.startinsert()
	else
		vim.api.nvim_win_hide(state.terminal.win)
	end
end, {})
vim.keymap.set("n", "<leader>wt", function() vim.cmd.FloatingTerminal() end, { desc = "Floating Terminal" })
