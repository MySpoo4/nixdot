local mapkey = require("util.keymapper").mapkey

local config = function()
	require("trouble").setup({
		win = {
			size = { height = 0.25 },
		},
	})
end

return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	config = config,
	keys = {
		mapkey("<leader>tt", function()
			require("trouble").toggle({ mode = "diagnostics", focus = true })
		end, "n"),
	},
}
