return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"typescript",
				"javascript",
				"graphql",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"go",
				"cmake",
				"cpp",
				"python",
				"swift",
				"graphql",
			},
			auto_install = false,
			sync_install = false,
			modules = {},
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = false,
			},
			autotag = {
				enable = true,
			},
		})
	end,
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			event = "InsertEnter",
			config = true,
		},
		"nvim-treesitter/nvim-treesitter-context",
	},
}
