local plugman = require("custom.plugin_manager")
local configs = require("plugins.configs")

-- plugman.addplug({
-- 	src = "https://github.com/shortcuts/no-neck-pain.nvim",
-- 	post_hook = configs.noNeckPain,
-- })

plugman.addplug({
	src = "https://github.com/echasnovski/mini.nvim",
	post_hook = configs.mini,
})

plugman.addplug({
	src = "https://github.com/ibhagwan/fzf-lua",
	post_hook = configs.fzf,
})

plugman.addplug({
	src = "https://github.com/folke/flash.nvim",
	post_hook = configs.flash,
})

plugman.addplug({
	src = "https://github.com/nvim-lualine/lualine.nvim",
	post_hook = configs.lualine,
})

plugman.addplug({
	src = "https://github.com/neovim/nvim-lspconfig",
	post_hook = configs.lspconfig,
})

plugman.addplug({
	src = "https://github.com/nvim-treesitter/nvim-treesitter",
	post_hook = configs.treesitter,
})

plugman.addplug({
	src = "https://github.com/lewis6991/gitsigns.nvim",
	post_hook = configs.gitsigns,
})

plugman.addplug({
	src = "https://github.com/folke/which-key.nvim",
	post_hook = configs.whichkey,
})

plugman.addplug({
	src = "https://github.com/Saghen/blink.cmp",
	version = "*",
	post_hook = configs.blink,
})

plugman.addplug({
	src = "https://github.com/stevearc/conform.nvim",
	post_hook = configs.conform,
})
