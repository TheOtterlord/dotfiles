require("catppuccin").setup({
	flavour = "auto", -- latte, frappe, macchiato, mocha
	transparent_background = true,
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

