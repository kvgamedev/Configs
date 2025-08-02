local state = {
	float_term = {
		buf = -1,
		win = -1,
	},
	lazy_git = {
		buf = -1,
		win = -1,
	},
}

local function createFloatingWindow(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)
	local buf = -1
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_config = {
		relative = "editor",
		title = opts.title or "Floating Winodw",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
		title_pos = opts.title_pos or "center",
	}
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

-- FloatTerm
vim.api.nvim_create_user_command("FloatTerm", function()
	if not vim.api.nvim_win_is_valid(state.float_term.win) then
		state.float_term = createFloatingWindow({ buf = state.float_term.buf, title = "Float Term" })
		vim.api.nvim_set_option_value("buflisted", false, { buf = state.float_term.buf })
		if vim.bo[state.float_term.buf].buftype ~= "terminal" then
			vim.cmd("terminal")
		end
		vim.cmd("startinsert")
	else
		vim.api.nvim_win_hide(state.float_term.win)
	end
end, {})

-- LazyGit
vim.api.nvim_create_user_command("LazyGit", function()
	state.lazy_git = createFloatingWindow({ buf = state.lazy_git.buf, title = "LazyGit" })
	vim.bo[state.lazy_git.buf].filetype = "lazygit"
	vim.api.nvim_buf_set_name(state.lazy_git.buf, "LazyGit")
	vim.fn.jobstart("lazygit", {
		term = true,
		on_exit = function()
			vim.api.nvim_win_close(state.lazy_git.win, true)
			vim.api.nvim_buf_delete(state.lazy_git.buf, { force = true })
		end,
	})
	vim.cmd("startinsert")
end, {})

-- Keymaps
vim.keymap.set("n", "<leader>o", "<Cmd>source lua/scripts/floaterm.lua<Cr>", { desc = "Source FloatTerm" })
vim.keymap.set({ "n", "t" }, "<leader>wt", "<cmd>FloatTerm<cr>", { desc = "FloatTerm" })
vim.keymap.set({ "n", "t" }, "<leader>wg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
