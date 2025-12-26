return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "macchiato",
		transparent_background = true,
		auto_integrations = true,
		integrations = {
			flash = true,
			lsp_trouble = true,
			noice = true,
			snacks = { enabled = true },
			mini = { enabled = true },
			blink_cmp = { style = "bordered" },
			mason = true,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
