local map = vim.keymap.set

map("n", "<Esc>", vim.cmd.nohlsearch, { desc = "Hide Search Matches" })

map({ "n", "v", "t", "c", "o" }, "<A-l>", "G", { desc = "Jump to Last Line" })
map({ "n", "v", "t", "c", "o" }, "<A-h>", "gg", { desc = "Jump to Last Line" })
map({ "n", "v", "o" }, "<S-l>", "$", { desc = "Jump to Last Character in Line" })
map({ "n", "v", "o" }, "<S-h>", "0", { desc = "Jump to Last Character in Line" })


map("n", "<leader>ws", "<C-w>s", { desc = "Split Window Horizontally" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split Window Vertically" })

map("n", "<leader>wh", "<C-w>h", { desc = "Go to the left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to the down window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to the up window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to the right window" })

map("n", "<leader>wH", "<C-w>H", { desc = "Move to the left window" })
map("n", "<leader>wJ", "<C-w>J", { desc = "Move to the down window" })
map("n", "<leader>wK", "<C-w>K", { desc = "Move to the up window" })
map("n", "<leader>wL", "<C-w>L", { desc = "Move to the right window" })
