local mapkey = require("util.keymapper").mapkey

local config = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},

		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,

		vim.api.nvim_create_user_command("FormatGlobalToggle", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
			vim.notify(string.format("Auto global formatting: %s", tostring(not vim.g.disable_autoformat)))
		end, {
			desc = "Toggle global autoformat on save",
		}),

		vim.api.nvim_create_user_command("FormatBufferToggle", function()
			vim.b.disable_autoformat = not vim.b.disable_autoformat
			vim.notify(string.format("Auto buffer formatting: %s", tostring(not vim.b.disable_autoformat)))
		end, {
			desc = "Toggle buffer autoformat on save",
		}),
	})
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = config,
	keys = {
		mapkey("<leader>af", "<CMD>FormatBufferToggle<CR>", "n"),
		mapkey("<leader>aF", "<CMD>FormatGlobalToggle<CR>", "n"),
	},
}
