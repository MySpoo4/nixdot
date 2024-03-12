local colorscheme = require("util.colorscheme")

local gruvbox = function()
	vim.g.gruvbox_material_foreground = "material"
	--background option can be hard, medium, soft
	vim.g.gruvbox_material_background = "medium"
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_better_performance = 1
	vim.cmd("colorscheme gruvbox-material")
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
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    enabled = colorscheme == "catppuccin",
    priority = 1000,
    config = catppuccin,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    name = "gruvbox-material",
    enabled = colorscheme == "gruvbox-material",
    priority = 1000,
    config = gruvbox,
  },
}
