local colorscheme = require("util.colorscheme")

local gruvbox = function()
	vim.g.gruvbox_material_foreground = "material"
	--background option can be hard, medium, soft
	vim.g.gruvbox_material_background = "medium"
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_better_performance = 1
	vim.cmd("colorscheme gruvbox-material")
end
return {
	"sainnhe/gruvbox-material",
	lazy = false,
	name = "gruvbox-material",
	enabled = colorscheme == "gruvbox-material",
	priority = 1000,
	config = gruvbox,
}
