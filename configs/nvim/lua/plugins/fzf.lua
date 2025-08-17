vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})
local fzf = require("fzf-lua")
fzf.register_ui_select()

vim.keymap.set("n", "<leader>f", fzf.files, { desc = "Files" })
vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "buffers" })
vim.keymap.set("n", "<leader>q", fzf.quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>*", fzf.grep_cword, { desc = "Grep Word" })
vim.keymap.set("n", "<leader>p", fzf.grep_project, { desc = "Grep Project" })
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

-- vim.keymap.set("n", "<leader>o", ":so fzf.lua<cr>", { desc = "Source FZF" })
