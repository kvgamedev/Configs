return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.icons").setup()
		require("mini.icons").mock_nvim_web_devicons()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		-- require("mini.statusline").setup()
	end,
}
