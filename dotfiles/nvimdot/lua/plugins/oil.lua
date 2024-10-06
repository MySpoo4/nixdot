local mapkey = require("util.keymapper").mapkey

local config = function()
	require("oil").setup({
		use_default_keymaps = false,
		constrain_cursor = "name",
		keymaps = {
			["<ENTER>"] = "actions.select",
			["g."] = "actions.toggle_hidden",
			["<C-p>"] = "actions.preview",
			["<C-r>"] = "actions.refresh",
			["<ESC>"] = {
				function()
					require("oil").discard_all_changes()
					require("oil").close()
				end,
				mode = "n",
				nowait = true,
				desc = "Close oil, discarding changes",
			},
		},
	})
end

return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
	key = {
		mapkey("-", "<CMD>Oil<CR>", "n", { desc = "Open Parent Dir" }),
	},
}
