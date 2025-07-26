M = {}
M.catppuccin = function()
	require("catppuccin").setup {
		transparent_background = true,
	}
	vim.cmd "colorscheme tokyonight"
end

M.gruvbox = function()
	require("gruvbox").setup {
		bold = false,
		contrast = "",
	}
end

M.noice = function()
	require("noice").setup {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
	}
end

M.gitsigns = function()
	require("gitsigns").setup {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged_enable = true,
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	}
end

M.whichkey = function()
	local wk = require "which-key"
	wk.setup {
		delay = 0,
		preset = "helix",
	}
	wk.add {
		{ "<leader>w", proxy = "<c-w>", group = "Windows" },
	}
end

M.mini = function()
	require("mini.statusline").setup {}
	require("mini.icons").setup {}
	MiniIcons.mock_nvim_web_devicons()
	require("mini.ai").setup {}
	require("mini.pairs").setup {}
	require("mini.surround").setup {}
	require("mini.comment").setup {}
	-- require("mini.jump2d").setup {}
end

M.conform = function()
	require("conform").setup {
		formatters_by_ft = {
			lua = { "stylua", lsp_format = "fallback" },
			rust = { "rustfmt", lsp_format = "fallback" },
			zig = { "zls", lsp_format = "fallback" },
			cpp = { "clang-format", lsp_format = "fallback" },
		},
	}

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format { bufnr = args.buf }
		end,
	})
end

M.luasnip = function()
	require "luasnip" { require("luasnip.loaders.from_vscode").load() }
end

M.lsp = function()
	vim.diagnostic.config {
		severity_sort = true,
		float = { border = "rounded", source = "if_many" },
		underline = { severity = vim.diagnostic.severity.ERROR },
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "󰅚 ",
				[vim.diagnostic.severity.WARN] = "󰀪 ",
				[vim.diagnostic.severity.INFO] = "󰋽 ",
				[vim.diagnostic.severity.HINT] = "󰌶 ",
			},
		} or {},
		virtual_text = {
			source = "if_many",
			border = "rounded",
			spacing = 2,
			prefix = "",
			format = function(diagnostic)
				local diagnostic_message = {
					--stylua: ignore start
					[vim.diagnostic.severity.ERROR] = "󰅚 " .. diagnostic.message .. " ",
					[vim.diagnostic.severity.WARN] = "󰀪 " .. diagnostic.message .. " ",
					[vim.diagnostic.severity.INFO] = "󰋽 " .. diagnostic.message .. " ",
					[vim.diagnostic.severity.HINT] = "󰌶 " .. diagnostic.message .. " ",
					--stylua: ignore end
				}
				return diagnostic_message[diagnostic.severity]
			end,
		},
	}
end
return M
