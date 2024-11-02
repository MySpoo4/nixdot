local colorscheme = require("util.colorscheme")

local gruvbox = function()
	vim.o.background = "dark" -- or "light" for light mode
	vim.g.gruvbox_material_foreground = "material"
	vim.g.gruvbox_material_background = "medium"
	vim.g.gruvbox_material_current_word = "grey background"
	vim.g.gruvbox_material_diagnostic_line_highlight = 1
	vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_enable_bold = 1
	vim.g.gruvbox_material_better_performance = 1

	vim.cmd("colorscheme gruvbox-material")

	-- changing bg and border colors
	vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
end

local catppuccin = function()
	require("catppuccin").setup({
		flavour = "macchiato",
		transparent_background = false,
	})
	vim.cmd("colorscheme catppuccin")
end

return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		name = "gruvbox-material",
		enabled = colorscheme == "gruvbox-material",
		priority = 1000,
		config = gruvbox,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		enabled = colorscheme == "catppuccin",
		priority = 1000,
		config = catppuccin,
	},
}
