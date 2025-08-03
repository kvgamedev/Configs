local map = vim.keymap.set
vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/echasnovski/mini.nvim",
})

require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons()
require("mini.statusline").setup({})
require("mini.files").setup({})
require("mini.ai").setup({})
require("mini.surround").setup({})
require("mini.pairs").setup({})
require("mini.notify").setup({})
map("n", "<leader>e", function() MiniFiles.open() end, { desc = "Explorer" })

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color(),
		fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
		todo = { pattern = "TODO", group = "MiniHiPatternsTodo" },
		note = { pattern = "NOTE", group = "MiniHiPatternsNote" },
	},
})

local fzf = require("fzf-lua")
fzf.setup({})
fzf.register_ui_select()

--stylua: ignore start

-- General Search
map("n", "<leader>sh", function() fzf.help_tags() end, { desc = "Help" })
map("n", "<leader>/", function() fzf.live_grep() end, { desc = "Grep" })
map("n", "<leader>f", function() fzf.files() end, { desc = "Files" })
map("n", "<leader>s.", function() fzf.resume() end, { desc = "Resume" })
map("n", "<leader>so", function() fzf.oldfiles() end, { desc = "Old Files" })
map("n", "<leader>sb", function() fzf.buffers() end, { desc = "Buffers" })
map("n", "<leader>s/", function() fzf.lines() end, { desc = "Lines" })
map("n", "<leader>s?", function() fzf.builtin() end, { desc = "Pickers" })
map("n", "<leader>sc", function() fzf.commands() end, { desc = "Commands" })
map("n", "<leader>sC", function() fzf.command_history() end, { desc = "Command History" })
map("n", "<leader>sw", function() fzf.grep_cword() end, { desc = "Word" })
map("n", "<leader>ss", function() fzf.search_history() end, { desc = "Search History" })
map("n", "<leader>sk", function() fzf.keymaps() end, { desc = "Keymaps" })
map("n", "<leader>sm", function() fzf.marks() end, { desc = "Marks" })
map("n", "<leader>sz", function() fzf.zoxide() end, { desc = "Zoxide" })

-- Lsp
map("n", "<leader>ld", function() fzf.lsp_document_diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>la", function() fzf.lsp_code_actions() end, { desc = "LSP Actions" })
map("n", "<leader>lr", function() fzf.lsp_references() end, { desc = "References" })
map("n", "<leader>li", function() fzf.lsp_implementations() end, { desc = "Implmentations" })
map("n", "<leader>ls", function() fzf.lsp_workspace_symbols() end, { desc = "Workspace Symbols" })
