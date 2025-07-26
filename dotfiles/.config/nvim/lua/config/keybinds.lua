--stylua: ignore start
local map = vim.keymap.set

map({ "n", "v", "o" }, "<A-l>", "G", { desc = "Last Line" })
map({ "n", "v", "o" }, "<A-h>", "gg", { desc = "First Line" })
map({ "n", "v", "o" }, "<S-l>", "$", { desc = "Last Character" })
map({ "n", "v", "o" }, "<S-h>", "0", { desc = "First Character" })

map({ "n" }, "<Esc>", vim.cmd.nohlsearch, { desc = "Remove Search Highlights" })
map({ "n" }, "<leader>e", "<cmd>Explore<cr>", { desc = "Open Explorer" })
map( { "n" }, "<leader>we", "<cmd>Sexplore<cr>", { desc = "Open Explorer in New Window" })
