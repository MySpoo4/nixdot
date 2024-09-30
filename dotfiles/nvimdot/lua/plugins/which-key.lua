return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local which_key = require("which-key")
		which_key.setup({
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			layout = {
				align = "center",
			},
			win = {
				border = "rounded",
				title = false,
				padding = { 1, 2 },
				no_overlap = true,
			},
			nowait = {
				"`",
				"'",
				"g'",
				'"',
				"<c-r>",
				"z=",
			},
		})

		which_key.add({
			{ "<leader>f", group = "Find" },
			{ "<leader>a", group = "Auto Formatting" },
			{ "<leader>s", group = "Pane Split" },
			{ "<leader>o", group = "Options Commands" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>d", group = "Diagnostics" },
		})
	end,
}
