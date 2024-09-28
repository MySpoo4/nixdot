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
		},
	})

	mason.setup(conf)

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"rust_analyzer",
			"lua_ls",
			"ts_ls",
			"svelte",
			"emmet_ls",
			"cssls",
			"jdtls",
		},
		-- auto-install configured servers (with lspconfig)
		automatic_installation = true, -- not the same as ensure_installed
	})

	mason_tool_installer.setup({
		ensure_installed = {
			"rustfmt", -- rust formatter (deprecated)
			"stylua", -- lua formatter
			"prettierd", -- general formatter (for ts, js, etc)
			"java-debug-adapter",
			"java-test",
			"codelldb",
		},
	})
end

return {
	"williamboman/mason.nvim",
	enabled = true,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = config,
}
