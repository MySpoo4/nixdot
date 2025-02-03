-- Lsp servers, and formatters can be setup
-- locally for each project instead of through mason

local config = function(_, opts)
	-- import mason
	local mason = require("mason")

	-- import mason-lspconfig
	local mason_lspconfig = require("mason-lspconfig")

	local mason_tool_installer = require("mason-tool-installer")

	-- enable mason and configure icons
	local conf = vim.tbl_deep_extend("keep", opts, {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
			border = "single",
			width = 0.8,
			height = 0.8,
		},
	})

	mason.setup(conf)

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"lua_ls", -- lua (neovim config)
			"nil_ls", -- nix (nix config)
		},
		-- auto-install configured servers (with lspconfig)
		automatic_installation = true, -- not the same as ensure_installed
	})

	mason_tool_installer.setup({
		ensure_installed = {
			"stylua", -- lua formatter
		},
	})
end

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = config,
}
