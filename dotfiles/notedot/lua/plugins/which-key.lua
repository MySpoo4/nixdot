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
			win = {
				padding = { 1, 2 },
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
			{ "<leader>f", group = "find" },
			{ "<leader>s", group = "split" },
			{ "<leader>b", group = "buffers" },
		})
	end,
}
