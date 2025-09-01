local map = function(mode, key, command, description)
	vim.keymap.set(mode, key, command, { desc = description })
end

-- map({ "n" }, "<leader>w", "<c-w>", "Window" ) -- this or using proxy in which-key
map({ "n", "v", "o" }, "<A-l>", "G", "Last Line" )
map({ "n", "v", "o" }, "<A-h>", "gg", "First Line" )
map({ "n", "v", "o" }, "<S-l>", "$", "Last Character" )
map({ "n", "v", "o" }, "<S-h>", "0", "First Character" )

map({ "n" }, "<Esc>", vim.cmd.nohlsearch, "Remove Search Highlights" )

map({ "n" }, "<c-d>", "<c-d>zz", "Jump Down Half Page and Recenter cursor" )
map({ "n" }, "<c-u>", "<c-u>zz", "Jump Up Half Page and Recenter cursor" )
map({ "n" }, "n", "nzz", "Next Match and Recenter" )
map({ "n" }, "N", "Nzz", "Previous Match and Recenter" )
