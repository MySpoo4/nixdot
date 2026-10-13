local mapkey = require("utils").mapkey

-- Window Management
mapkey("<leader>sv", "<CMD>split<CR>", "n", { desc = "Split Vertically" }) -- Split Vertically
mapkey("<leader>sh", "<CMD>vsplit<CR>", "n", { desc = "Split Horizontally" }) -- Split Horizontally

mapkey("<leader>u", "<CMD>Undotree<CR>", "n", { desc = "Open Undotree" })

mapkey("<leader>ow", function()
  vim.opt.wrap = not vim.o.wrap
  vim.notify(string.format("Word Wrap: %s", tostring(vim.o.wrap)))
end, "n", { desc = "Toggle Wrap" })

mapkey("<leader>ol", function()
  vim.opt.linebreak = not vim.o.linebreak
  vim.notify(string.format("Linebreak: %s", tostring(vim.o.linebreak)))
end, "n", { desc = "Toggle Linebreak" })

-- pack keymaps
mapkey("<leader>pu", vim.pack.update, "n", { desc = "Update all plugins" })

mapkey("<leader>pd", function()
  vim.pack.del(vim
    .iter(vim.pack.get())
    :filter(function(x)
      return not x.active
    end)
    :map(function(x)
      return x.spec.name
    end)
    :totable())
end, "n", { desc = "Delete inactive plugins" })
