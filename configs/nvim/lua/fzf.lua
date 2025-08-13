vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})
local fzf = require("fzf-lua")
fzf.register_ui_select()

--stylua: ignore start
vim.keymap.set("n", "<leader>f",  function() fzf.files()           end, { desc = "Files" })
vim.keymap.set("n", "<leader>/",  function() fzf.live_grep()       end, { desc = "Grep" })
vim.keymap.set("n", "<leader>sc", function() fzf.commands()        end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sh", function() fzf.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sH", function() fzf.helptags()        end, { desc = "Help" })
vim.keymap.set("n", "<leader>sk", function() fzf.keymaps()         end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>b",  function() fzf.buffers()         end, { desc = "buffers" })
vim.keymap.set("n", "<leader>s/", function() fzf.lines()           end, { desc = "lines" })
vim.keymap.set("n", "<leader>q",  function() fzf.quickfix()        end, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>*",  function() fzf.grep_cword()      end, { desc = "Grep Word" })
vim.keymap.set("n", "<leader>p",  function() fzf.grep_project()    end, { desc = "Grep Project" })
vim.keymap.set("n", "<leader>?",  function() fzf.builtin()    end, { desc = "Grep Project" })
--stylua: ignore stop
