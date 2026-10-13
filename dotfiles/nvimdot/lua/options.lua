require("vim._core.ui2").enable()
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

-- GLOBAL
--------------------------------------------------------------------------------
-- Set <space> as leader key
-- NOTE: Must happen before loading plugins.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

--------------------------------------------------------------------------------

-- UI / Appearance
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.termguicolors = true -- True color support
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.showmode = false -- TODO remove when issue #39589 is fixed

vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below

vim.opt.pumheight = 8
vim.opt.pummaxwidth = 80
vim.opt.wildmode = { "noselect" }
vim.opt.wildoptions = { "pum", "fuzzy" }
vim.opt.completeopt = { "fuzzy", "noselect", "menuone", "popup" }

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.undofile = true

vim.opt.clipboard:append("unnamedplus") -- System clipboard integration
