return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.comment").setup()
		require("mini.starter").setup()
		require("mini.statusline").setup()
		require("mini.tabline").setup()
		require("mini.sessions").setup()
		require("mini.indentscope").setup()
		require("mini.files").setup()
	end,
}
