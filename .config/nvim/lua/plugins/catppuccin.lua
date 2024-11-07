return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "frappe",
		integrations = {
			cmp = true,
			gitsigns = true,
			treesitter = true,
			mini = {
				enabled = true,
			},
			mason = true,
			neotree = true,
			which_key = true,
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	},
}
