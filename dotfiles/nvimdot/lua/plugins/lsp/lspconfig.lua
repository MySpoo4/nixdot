local config = function()
	vim.lsp.set_log_level("off")
	-- import lspconfig plugin
	local lspconfig = require("lspconfig")

	-- import cmp-nvim-lsp plugin
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local keymap = vim.keymap -- for conciseness

	local opts = { noremap = true, silent = true }
	local on_attach = function(client, bufnr)
		opts.buffer = bufnr

		-- set keybinds
		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

		opts.desc = "Show LSP definitions"
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	end

	-- used to enable autocompletion (assign to every lsp server config)
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- Change the Diagnostic symbols in the sign column (gutter)
	-- (not in youtube nvim video)
	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	vim.g.rustaceanvim = {
		server = {
			cmd = function()
				local mason_registry = require("mason-registry")
				local ra_binary = mason_registry.is_installed("rust-analyzer")
						-- This may need to be tweaked, depending on the operating system.
						and mason_registry.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer"
					or "rust-analyzer"
				return { ra_binary } -- You can add args to the list, such as '--log-file'
			end,
		},
	}

	-- vim.g.rustaceanvim = {
	-- 	-- Plugin configuration
	-- 	tools = {},
	-- 	-- LSP configuration
	-- 	server = {
	-- 		on_attach = on_attach,
	-- 		settings = {
	-- 			-- rust-analyzer language server configuration
	-- 			["rust-analyzer"] = {
	-- 				cargo = {
	-- 					allFeatures = true,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	-- DAP configuration
	-- 	dap = {},
	-- }

	-- configure lua server (with special settings)
	lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	lspconfig["jdtls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- configure css, scss server
	lspconfig["cssls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- configure typescript server
	lspconfig["ts_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["cssls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["emmet_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "html", "css", "sass", "scss", "svelte" },
	})
end

return {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = config,
}
