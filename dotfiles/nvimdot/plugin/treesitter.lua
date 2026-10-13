local config = function()
  require("tree-sitter-manager").setup({
    ensure_installed = {
      "lua",
      "c",
    },
    border = "single",
  })
end

load_plugin({
  src = "https://github.com/romus204/tree-sitter-manager.nvim",
  config = config,
})
