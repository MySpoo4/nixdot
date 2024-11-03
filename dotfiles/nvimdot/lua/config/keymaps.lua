local mapkey = require("util.keymapper").mapkey

-- Remapping gj and gk for wrapped lines
-- mapkey("k", "v:count == 0 ? 'gk':'k'", "n", { desc = "Up", expr = true })
-- mapkey("j", "v:count == 0 ? 'gj':'j'", "n", { desc = "Down", expr = true })

-- Split Navigation
mapkey("<C-h>", "<C-w>h", "n", { desc = "Focus Left" }) -- navigate left
mapkey("<C-j>", "<C-w>j", "n", { desc = "Focus Down" }) -- navigate down
mapkey("<C-k>", "<C-w>k", "n", { desc = "Focus Up" }) -- navigate up
mapkey("<C-l>", "<C-w>l", "n", { desc = "Focus Right" }) -- navigate right

-- -- insert mode split navigation
-- mapkey("<C-h>", "<ESC><C-w>h", "i", { desc = "Focus Left" }) -- navigate left
-- mapkey("<C-j>", "<ESC><C-w>j", "i", { desc = "Focus Down" }) -- navigate down
-- mapkey("<C-k>", "<ESC><C-w>k", "i", { desc = "Focus Up" }) -- navigate up
-- mapkey("<C-l>", "<ESC><C-w>l", "i", { desc = "Focus Right" }) -- navigate right

-- Window Management
mapkey("<leader>sv", "<CMD>split<CR>", "n", { desc = "Split Vertically" }) -- Split Vertically
mapkey("<leader>sh", "<CMD>vsplit<CR>", "n", { desc = "Split Horizontally" }) -- Split Horizontally

-- Resize windows or panes
mapkey("<C-S-H>", "3<C-w>>", "n", { desc = "Resize Left" })
mapkey("<C-S-J>", "3<C-w>-", "n", { desc = "Resize Right" })
mapkey("<C-S-K>", "3<C-w>+", "n", { desc = "Resize Up" })
mapkey("<C-S-L>", "3<C-w><", "n", { desc = "Resize Down" })

-- Navigate between quickfix items
mapkey("<leader>j", "<CMD>cnext<CR>zz", "n", { desc = "QuickFixList Next" })
mapkey("<leader>k", "<CMD>cprev<CR>zz", "n", { desc = "QuickFixList Previous" })

-- Nvim Options and Commands
mapkey("<leader>ow", function()
	vim.opt.wrap = not vim.o.wrap
	vim.notify(string.format("Word Wrap: %s", tostring(vim.o.wrap)))
end, "n", { desc = "Toggle Wrap" })

mapkey("<leader>ol", function()
	vim.opt.linebreak = not vim.o.linebreak
	vim.notify(string.format("Linebreak: %s", tostring(vim.o.linebreak)))
end, "n", { desc = "Toggle Linebreak" })

mapkey("<leader>os", function()
	vim.opt.spell = not vim.o.spell
	vim.notify(string.format("Spell Check: %s", tostring(vim.o.spell)))
end, "n", { desc = "Toggle Spell Check" })

mapkey("<leader>op", "<CMD>pwd<CR>", "n", { desc = "Current Working Directory" })

-- Indenting
mapkey("<", "<gv", "v", { desc = "Indent >" }) -- Shift Indentation to Left
mapkey(">", ">gv", "v", { desc = "Indent <" }) -- Shift Indentation to Right
