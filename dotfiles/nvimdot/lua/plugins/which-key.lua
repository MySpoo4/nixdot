local config = function()
	local which_key = require("which-key")
	which_key.setup({
		plugins = {
			spelling = {
				enabled = true,
				suggestions = 20,
			},
		},
		show_keys = false,
		show_help = false,
		layout = {
			align = "center",
		},
		win = {
			border = "single",
			title = false,
			padding = { 1, 1 },
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
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = config,
}
