local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")
local colorscheme = require("util.colorscheme")

local opts = {
	install = {
		colorscheme = { colorscheme },
	},
	ui = {
		border = "single",
		size = {
			width = 0.8,
			height = 0.8,
		},
		backdrop = 100,
	},
	rpt = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
}

local imports = {
	{
		import = "plugins",
	},
	{
		import = "plugins.lsp",
	},
}

require("lazy").setup(imports, opts)
