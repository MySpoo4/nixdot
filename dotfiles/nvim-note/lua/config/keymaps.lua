local mapkey = require("util.keymapper").mapkey

-- Buffer Navigation
mapkey("<S-h>", "<CMD>bp<CR>", "n") -- previous buffer
mapkey("<S-l>", "<CMD>bn<CR>", "n") -- next buffer

-- Split Navigation
mapkey("<C-h>", "<C-w>h", "n") -- navigate left
mapkey("<C-j>", "<C-w>j", "n") -- navigate down
mapkey("<C-k>", "<C-w>k", "n") -- navigate up
mapkey("<C-l>", "<C-w>l", "n") -- navigate right

-- Window Management
mapkey("<leader>sv", "<CMD>vsplit<CR>", "n") -- Split Vertically
mapkey("<leader>sh", "<CMD>split<CR>", "n") -- Split Horizontally
mapkey("<leader>sm", "<CMD>MaximizerToggle<CR>", "n") -- Toggle Minimize

-- Indenting
mapkey("<", "<gv", "v") -- Shift Indentation to Left
mapkey(">", ">gv", "v") -- Shift Indentation to Right

-- Wrap
mapkey("<leader>uw", "<CMD>set wrap!<CR>", "n")

-- Comments
