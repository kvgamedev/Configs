M = {}

M.blink = function()
	require("blink.cmp").setup({
		completion = { documentation = { auto_show = true } },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	})
end

M.fzf = function()
	local fzf = require("fzf-lua")
	fzf.register_ui_select()

	vim.keymap.set("n", "<leader>f", fzf.files, { desc = "Files" })
	vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Grep" })
	vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "Buffers" })
	vim.keymap.set("n", "<leader>q", fzf.quickfix, { desc = "Quickfix" })
	vim.keymap.set("n", "<leader>*", fzf.grep_cword, { desc = "Grep Word" })
	vim.keymap.set("n", "<leader>p", fzf.grep_project, { desc = "Grep Project" })
	vim.keymap.set("n", "<leader>z", fzf.zoxide, { desc = "Zoxide" })

	vim.keymap.set("n", "<leader>s", "<Nop>", { desc = "Search" })
	vim.keymap.set("n", "<leader>s/", fzf.lines, { desc = "Lines" })
	vim.keymap.set("n", "<leader>sc", fzf.commands, { desc = "Commands" })
	vim.keymap.set("n", "<leader>sh", fzf.command_history, { desc = "Command History" })
	vim.keymap.set("n", "<leader>sH", fzf.helptags, { desc = "Help" })
	vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Keymaps" })
	vim.keymap.set("n", "<leader>s?", fzf.builtin, { desc = "Pickers" })

	-- LSP
	vim.keymap.set("n", "<leader>l", "<Nop>", { desc = "LSP Search" })
	vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, { desc = "Definitions" })
	vim.keymap.set("n", "<leader>lr", fzf.lsp_references, { desc = "References" })
	vim.keymap.set("n", "<leader>lt", fzf.lsp_typedefs, { desc = "TypeDefs" })
	vim.keymap.set("n", "<leader>la", fzf.lsp_code_actions, { desc = "Code Actions" })
	vim.keymap.set("n", "<leader>li", fzf.lsp_implementations, { desc = "Implementations" })
	vim.keymap.set("n", "<leader>ls", fzf.lsp_document_symbols, { desc = "Document Symbols" })
	vim.keymap.set("n", "<leader>le", fzf.lsp_document_diagnostics, { desc = "Document Diagnostics" })

	vim.keymap.set("n", "<leader>lw", "<Nop>", { desc = "Workspace" })
	vim.keymap.set("n", "<leader>lws", fzf.lsp_workspace_symbols, { desc = "Workspace Symbols" })
	vim.keymap.set("n", "<leader>lwd", fzf.lsp_workspace_diagnostics, { desc = "Workspace Diagnostics" })

	-- Git
	vim.keymap.set("n", "<leader>g", "<Nop>", { desc = "Git Search" })
	vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "Git Branches" })
end

M.mini = function()
	require("mini.files").setup({
		windows = { preview = true }
	})
	vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "MiniFile" })

	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()

	require("mini.pick").setup()
	require("mini.ai").setup()
	require("mini.align").setup()
	require("mini.comment").setup()
	require("mini.surround").setup()
	require("mini.splitjoin").setup()
	require("mini.notify").setup()
	require("mini.operators").setup()
	require("mini.bracketed").setup()
	require("mini.tabline").setup()

	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})
end

M.flash = function()
	vim.keymap.set({ "n", "x", "o" }, "<return>", require("flash").jump, { desc = "Flash" })
	vim.keymap.set({ "n", "x", "o" }, "<s-return>", require("flash").treesitter, { desc = "Flash Treesitter" })
	vim.keymap.set({ "o" }, "r", require("flash").remote, { desc = "Remote Flash" })
	vim.keymap.set({ "x", "o" }, "R", require("flash").treesitter_search, { desc = "Treesitter Search" })
	vim.keymap.set({ "c" }, "<c-s>", require("flash").toggle, { desc = "Toggle Flash Search" })
end

M.conform = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			zig = { "zigfmt" },
			cpp = { "clang-format" },
		},
	})
	vim.keymap.set("n", "glf", require("conform").format, { desc = "Format Buffer" })
end

M.noNeckPain = function()
	vim.cmd.NoNeckPain()
end

M.whichkey = function()
	local wk = require("which-key")
	wk.setup({
		delay = 0,
		preset = "helix",
		show_help = false,
	})
	wk.add({
		{ "<leader>w", proxy = "<c-w>", desc = "Window" },
	})
end

M.gitsigns = function() end

M.treesitter = function()
	---@diagnostic disable: missing-fields
	require("nvim-treesitter.configs").setup({
		auto_install = true,
		highlight = { enable = true },
	})
end

M.lspconfig = function()
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
end

M.lualine = function()
	---@diagnostic disable: undefined-field
	require("lualine").setup({})
end

return M
