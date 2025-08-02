local map = vim.keymap.set
map({ "t" }, "<esc><esc>", "<c-\\><c-n>", { desc = "Exit Terminal Mode" })
map({ "n", "v", "o" }, "<A-l>", "G", { desc = "Last Line" })
map({ "n", "v", "o" }, "<A-h>", "gg", { desc = "First Line" })
map({ "n", "v", "o" }, "<S-l>", "$", { desc = "Last Character" })
map({ "n", "v", "o" }, "<S-h>", "0", { desc = "First Character" })
map({ "n" }, "<Esc>", function() vim.cmd("nohlsearch") end, { desc = "Remove Search Highlights" })
