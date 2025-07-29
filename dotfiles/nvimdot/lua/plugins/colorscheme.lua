local colorscheme = require("util.colorscheme")

local gruvbox = function()
	vim.o.background = "dark" -- or "light" for light mode
	vim.g.gruvbox_material_foreground = "material"
	vim.g.gruvbox_material_background = "medium"
	vim.g.gruvbox_material_diagnostic_line_highlight = 1
	vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_enable_bold = 1
	vim.g.gruvbox_material_better_performance = 1
	-- vim.g.gruvbox_material_current_word = "grey background"

	vim.cmd("colorscheme gruvbox-material")

	-- changing bg and border colors
	vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
	vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
	vim.api.nvim_set_hl(0, "PmenuSel", { link = "Visual" })
end

return {
	"sainnhe/gruvbox-material",
	lazy = false,
	name = "gruvbox-material",
	priority = 1000,
	config = gruvbox,
}
