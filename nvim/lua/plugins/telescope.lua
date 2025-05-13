return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		-- { "nvim-telescope/telescope-file-browser.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local map = vim.keymap.set

		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				-- file_browser = {
				-- 	theme = "ivy",
				-- 	hijack_netrw = true,
				-- },

				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},

			pickers = {
				find_files = {
					mappings = {
						n = {
							["<A-i>"] = require("telescope.actions").close,
						},
					},
				},
			},
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		map("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
		map("n", "<leader>sg", builtin.live_grep, { desc = "Grep" })
		map("n", "<leader>sb", builtin.buffers, { desc = "Buffers" })
		map("n", "<leader>sh", builtin.help_tags, { desc = "Help" })
		map("n", "<leader>ss", builtin.builtin, { desc = "Telescope" })
		map("n", "<leader>sm", builtin.marks, { desc = "Marks" })
		-- map("n", "<leader>fb", function() telescope.extensions.file_browser.file_browser() end, { desc = "File Browser" })
	end,
}
