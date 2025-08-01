local map = vim.keymap.set
map({ "n", "v", "o" }, "<A-l>", "G", { desc = "Last Line" })
map({ "n", "v", "o" }, "<A-h>", "gg", { desc = "First Line" })
map({ "n", "v", "o" }, "<S-l>", "$", { desc = "Last Character" })
map({ "n", "v", "o" }, "<S-h>", "0", { desc = "First Character" })
map({ "n" }, "<Esc>", function() vim.cmd("nohlsearch") end, { desc = "Remove Search Highlights" })
map({ "n" }, "<leader>o", "<cmd>source $MYVIMRC<cr>", { desc = "Source Neovim Config" })
-- map({ "n" }, "<leader>w", "<c-w>", { desc = "Window" })
