local init = function()
  vim.g.canola = {
    delete = { recursive = true },
    keymaps = {
      ["<C-c>"] = {
        callback = function()
          require("canola").discard_all_changes()
          require("canola").close()
        end,
        mode = "n",
      },
      ["q"] = {
        callback = function()
          require("canola").discard_all_changes()
          require("canola").close()
        end,
        mode = "n",
      },
    },
  }
end

local config = function()
  local mapkey = require("utils").mapkey

  mapkey("-", function()
    require("canola").open()
  end, "n", { desc = "Open Parent Dir" })
end

load_plugin({
  src = "https://github.com/barrettruth/canola.nvim",
  version = "canola",
  init = init,
  config = config,
})
