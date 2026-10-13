local gruvbox = function()
  require("gruvbox-material").setup({
    italics = true,
    contrast = "medium",
  })

  vim.cmd("colorscheme gruvbox-material") end

load_plugin({
  src = "https://github.com/f4z3r/gruvbox-material.nvim",
  config = gruvbox,
})

-- local catppuccin = function()
--   vim.cmd("colorscheme catppuccin-macchiato")
-- end
--
-- load_plugin({
--   src = "https://github.com/catppuccin/nvim",
--   config = catppuccin,
-- })
