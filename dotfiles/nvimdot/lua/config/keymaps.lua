local mapkey = require("util.keymapper").mapkey

-- Remapping gj and gk for wrapped lines
mapkey("j", "gj", "n", { desc = "Down In Wrap" })
mapkey("k", "gk", "n", { desc = "Up In Wrap" })

-- Buffer Navigation
mapkey("<S-h>", "<CMD>bp<CR>", "n", { desc = "Next buffer" }) -- previous buffer
mapkey("<S-l>", "<CMD>bn<CR>", "n", { desc = "Previous Buffer" }) -- next buffer

-- Split Navigation
mapkey("<C-h>", "<C-w>h", "n", { desc = "Focus Left" }) -- navigate left
mapkey("<C-j>", "<C-w>j", "n", { desc = "Focus Down" }) -- navigate down
mapkey("<C-k>", "<C-w>k", "n", { desc = "Focus Up" }) -- navigate up
mapkey("<C-l>", "<C-w>l", "n", { desc = "Focus Right" }) -- navigate right

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
mapkey("<leader>ow", ":set wrap<cr>", "n", { desc = "Wrap Lines" })
mapkey("<leader>oW", ":set nowrap<cr>", "n", { desc = "Unwrap Lines" })
mapkey("<leader>ol", ":set linebreak<cr>", "n", { desc = "Break Lines" })
mapkey("<leader>oL", ":set nolinebreak<cr>", "n", { desc = "Unbreak Lines" })
mapkey("<leader>os", ":set spell<cr>", "n", { desc = "Spell Check On" })
mapkey("<leader>oS", ":set nospell<cr>", "n", { desc = "Spell Check Off" })
mapkey("<leader>oh", ":nohlsearch<cr>", "n", { desc = "Disable Search Highlight" })
mapkey("<leader>oH", ":set hlsearch<cr>", "n", { desc = "Enable Search Highlight" })
mapkey("<leader>op", ":pwd<cr>", "n", { desc = "Current Working Directory" })

-- Indenting
mapkey("<", "<gv", "v", { desc = "Indent >" }) -- Shift Indentation to Left
mapkey(">", ">gv", "v", { desc = "Indent <" }) -- Shift Indentation to Right

-- Formatting
mapkey("<leader>af", "<CMD>FormatBufferToggle<CR>", "n")
mapkey("<leader>aF", "<CMD>FormatGlobalToggle<CR>", "n")
