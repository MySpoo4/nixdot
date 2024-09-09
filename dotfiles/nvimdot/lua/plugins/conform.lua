local config = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,

		vim.api.nvim_create_user_command("FormatToggle", function()
			vim.b.disable_autoformat = not vim.b.disable_autoformat
			vim.notify(string.format("Auto formatting: &s", not vim.b.disable_autoformat))
		end, {
			desc = "Toggle autformat on save",
		}),
	})
end

return {
	"stevearc/conform.nvim",
	config = config,
}
