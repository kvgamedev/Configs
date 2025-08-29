local M = {}
M.picker = {
	buf = -1,
	win = -1,
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

M.open_picker = function(opts)
	opts = opts or {}
	M.picker = M.createFloatingWin({ buf = M.picker.buf, title = opts.name })
	vim.fn.jobstart(opts.cmd, {
		term = true,
		on_exit = opts.exit,
	})
	vim.cmd.startinsert()
end

M.files = function()
	M.open_picker({
		cmd = "fzf --preview='bat --color=always {}'",
		exit = function()
			local lines = vim.api.nvim_buf_get_lines(M.picker.buf, 0, -1, false)
			local selected_file = lines[1]
			if selected_file and vim.fn.filereadable(selected_file) == 1 then
				vim.api.nvim_win_close(M.picker.win, true)
				vim.cmd("edit " .. vim.fn.fnameescape(selected_file))
			end
			vim.api.nvim_buf_delete(M.picker.buf, { force = true })
		end,
	})
end

vim.api.nvim_create_user_command("Picker", M.files, {})
vim.keymap.set("n", "<leader>ts", vim.cmd.Picker, { desc = "Custom Picker" })

return M
