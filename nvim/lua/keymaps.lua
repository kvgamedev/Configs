local map = vim.keymap.set

map("n", "<leader>cd", vim.cmd.Ex, { desc = "Explorer" })
map("n", "<Esc>", vim.cmd.nohlsearch, { desc = "Hide search matches" })

map("n", "<leader>nh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>nv", "<C-w>v", { desc = "Split window vertically" })

map("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })
