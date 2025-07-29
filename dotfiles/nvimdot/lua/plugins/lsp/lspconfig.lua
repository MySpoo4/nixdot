local config = function()
	-- vim.lsp.set_log_level("off")
	-- vim.lsp.set_log_level("debug")

	vim.diagnostic.config({
		-- virtual_lines = {
		-- 	current_line = true,
		-- },
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = "󰠠 ",
				[vim.diagnostic.severity.INFO] = " ",
			},
		},
	})

	local keymap = vim.keymap -- for conciseness

	local opts = { noremap = true, silent = true }
	local on_attach = function(_, bufnr)
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
		keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float({
				border = "single",
				max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
				max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.5),
			})
		end, opts) -- show diagnostics for line

		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts) -- jump to previous diagnostic in buffer

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts) -- jump to next diagnostic in buffer

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "single",
				max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
				max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.5),
			})
		end, opts) -- show documentation for what is under cursor

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	end

	-- used to enable autocompletion (assign to every lsp server config)
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	vim.lsp.enable({
		"rust_analyzer",
		"lua_ls",
		"jdtls",
		"clangd",
		"pyright",
		"ocamllsp",
		"ts_ls",
		"svelte",
		"cssls",
		"emmet_ls",
	})

	vim.lsp.config("*", {
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- manually setting it (global not working, idk why)
	vim.lsp.config("rust_analyzer", {
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- manually setting it (global not working, idk why)
	vim.lsp.config("pyright", {
		capabilities = capabilities,
		on_attach = on_attach,
	})

	vim.lsp.config("ts_ls", {
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- configure lua server (with special settings)
	vim.lsp.config("lua_ls", {
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

	-- configure nix server
	vim.lsp.config("nil_ls", {
		settings = {
			["nil"] = {
				formatting = {
					command = { "nixfmt" },
				},
			},
		},
	})

	-- configure java server
	vim.lsp.config("jdtls", {
		handlers = {
			["language/status"] = function(_, _) end,
			["$/progress"] = function(_, _) end,
		},
		cmd = {
			"jdtls",
			"--data",
			vim.fn.stdpath("cache") .. "/jdtls/workspace", -- Use a generic workspace directory
		},
		root_dir = function()
			return vim.fn.getcwd()
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "saghen/blink.cmp" },
	config = config,
}
