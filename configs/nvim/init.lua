vim.g.mapleader = " "
vim.g.localmapleader = " "

local o = vim.o
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local lsp_servers = { "lua_ls", "zls", "clangd" }

-- Options
o.swapfile = false
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.tabstop = 4
o.shiftwidth = 4
o.showmode = false
o.scrolloff = 10
o.mouse = "nvichar"
o.list = true
o.incsearch = true
o.inccommand = "split"
o.ignorecase = true
o.smartcase = true
o.confirm = true
o.copyindent = true
o.breakindent = true
o.showbreak = "󱞩 "
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.startofline = true
o.undofile = true
o.wrapmargin = 5
o.laststatus = 0
o.cmdheight = 1
o.winborder = "rounded"
o.listchars = "tab:  ,trail:"
o.cursorline = false
o.termguicolors = true
-- o.guicursor =
-- 	"n:block-MiniStatusLineModeNormal,i:block-MiniStatusLineModeInsert,v:block-MiniStatusLineModeVisual,r:block-MiniStatusLineModeReplace,t:block-MiniStatusLineModeOther"

-- Keymaps
map({ "n", "v", "o" }, "<A-l>", "G", { desc = "Last Line" })
map({ "n", "v", "o" }, "<A-h>", "gg", { desc = "First Line" })
map({ "n", "v", "o" }, "<S-l>", "$", { desc = "Last Character" })
map({ "n", "v", "o" }, "<S-h>", "0", { desc = "First Character" })
map({ "n" }, "<Esc>", function()
	vim.cmd("nohlsearch")
end, { desc = "Remove Search Highlights" })

-- Autocommands
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

autocmd("LspAttach", {
	once = true,
	callback = function()
		--stylua: ignore start
		map("n", "gld", function() vim.lsp.buf.definition() end, { desc = "Goto Definition" })
		map("n", "gli", function() vim.lsp.buf.implementation() end, { desc = "Goto Implementation" })
		map("n", "glt", function() vim.lsp.buf.type_definition() end, { desc = "Goto Type Definition" })
		map("n", "gln", function() vim.lsp.buf.rename() end, { desc = "Rename" })
		map("n", "gla", function() vim.lsp.buf.code_action() end, { desc = "Code Actions" })
		--stylua: ignore stop
	end,
})

-- Plugins
vim.pack.add({
	"https://github.com/folke/snacks.nvim",
	"https://github.com/ellisonleao/gruvbox.nvim",
})

-- Colorscheme
vim.cmd("colorscheme gruvbox")

-- Snacks
Snacks.setup({
	input = { enabled = true },
	statuscolumn = { enabled = true },
	animate = { enabled = true },
	notifier = { enabled = true },
	image = { enabled = true },
	quickfile = { enabled = true },
	terminal = { win = { position = "float", border = "rounded" } },
	picker = { ui_select = true },
})

-- Pickers: Search
local picker = Snacks.picker

--stylua: ignore start
map("n", "<leader>f",  function() picker.files()           end, { desc = "Files" })
map("n", "<leader>sf", function() picker.smart()           end, { desc = "Smart Files" })
map("n", "<leader>/",  function() picker.grep()            end, { desc = "Grep" })
map("n", "<leader>*",  function() picker.grep_word()       end, { desc = "Grep Word" })
map("n", "<leader>sw", function() picker.grep_word()       end, { desc = "Grep Word" })
map("n", "<leader>sg", function() picker.grep_buffers()    end, { desc = "Grep Buffers" })
map("n", "<leader>sr", function() picker.resume()          end, { desc = "Resume" })
map("n", "<leader>sl", function() picker.lines()           end, { desc = "Lines" })
map("n", "<leader>b",  function() picker.buffers()         end, { desc = "Buffers" })
map("n", "<leader>ss", function() picker.search_history()  end, { desc = "Search History" })
map("n", "<leader>sc", function() picker.commands()        end, { desc = "Commands" })
map("n", "<leader>sh", function() picker.command_history() end, { desc = "Command History" })
map("n", "<leader>sH", function() picker.help()            end, { desc = "Help" })
map("n", "<leader>sp", function() picker.pickers()         end, { desc = "Pickers" })
map("n", "<leader>sa", function() picker.autocmds()        end, { desc = "AutoCommands" })
map("n", "<leader>su", function() picker.undo()            end, { desc = "Undo History" })
map("n", "<leader>sz", function() picker.zoxide()          end, { desc = "Zoxide" })

-- Pickers: LSP
map("n", "<leader>lD", function() picker.diagnostics()           end, { desc = "Definitions" })
map("n", "<leader>ld", function() picker.lsp_definitions()       end, { desc = "Definitions" })
map("n", "<leader>lr", function() picker.lsp_references()        end, { desc = "References" })
map("n", "<leader>li", function() picker.lsp_implementations()   end, { desc = "Implementations" })
map("n", "<leader>lt", function() picker.lsp_type_definitions()  end, { desc = "Type Definitions" })
map("n", "<leader>ls", function() picker.lsp_symbols()           end, { desc = "Symbols" })
map("n", "<leader>lw", function() picker.lsp_workspace_symbols() end, { desc = "Workspace Symbols" })

-- Windows
map("n", "<c-w>g", function() Snacks.lazygit()  end, { desc = "LazyGit" })
map({ "n", "t" }, "<c-w>t", function() Snacks.terminal.toggle() end, { desc = "Terminal" })
map("n", "<leader>e", function() Snacks.explorer({ layout = { layout = { position = "right" }}}) end, { desc = "Explorer" })
-- stylua: ignore stop

-- Lazy loading
local lazy_group = vim.api.nvim_create_augroup("UserLazyLoad", { clear = true })

autocmd({ "BufReadPre", "BufNewFile" }, {
	group = lazy_group,
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/echasnovski/mini.nvim",
			"https://github.com/neovim/nvim-lspconfig",
			"https://github.com/nvim-treesitter/nvim-treesitter",
			{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
		})

		-- Mini
		require("mini.icons").setup({})
		MiniIcons.mock_nvim_web_devicons()
		require("mini.ai").setup({})
		require("mini.surround").setup({})
		require("mini.comment").setup({})
		require("mini.pairs").setup({})
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				hex_color = hipatterns.gen_highlighter.hex_color(),
				fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
				todo = { pattern = "TODO", group = "MiniHiPatternsTodo" },
				note = { pattern = "NOTE", group = "MiniHiPatternsNote" },
			},
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

		vim.lsp.client.capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.enable(lsp_servers)

		-- Treesitter: Highlighting
		--- @diagnostic disable: missing-fields
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
		})

		-- Blink: AutoCompletion
		require("blink.cmp").setup({
			completion = { documentation = { auto_show = true } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})
	end,
})

autocmd({ "BufReadPost", "BufNewFile" }, {
	group = lazy_group,
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/folke/which-key.nvim",
			"https://github.com/stevearc/conform.nvim",
			"https://github.com/lewis6991/gitsigns.nvim",
		})

		-- Conform: Formatting
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				zig = { "zigfmt" },
				cpp = { "clang-format" },
			},
		})
		map("n", "glf", function()
			require("conform").format()
		end, { desc = "Format Buffer" })

		-- Which-Key
		local wk = require("which-key")
		wk.setup({ delay = 0, preset = "helix" })
		wk.add({ "<leader>w", proxy = "<c-w>", desc = "Windows" })

		-- Toggles
		map("n", "<leader>oh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "Inlay Hints"})
		map("n", "<leader>ot", "<cmd>TSToggle highlight<cr>", { desc = "Treesitter"})
	end,
})
