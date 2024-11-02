local mapkey = require("util.keymapper").mapkey

local config = function()
	require("notify").setup({
		timeout = 3000,
		render = "wrapped-compact",
		max_height = function()
			return math.floor(vim.opt.lines:get() * 0.75)
		end,
		max_width = function()
			return math.floor(vim.opt.columns:get() * 0.5)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	})

	vim.api.nvim_create_user_command("NotificationsDismiss", function()
		require("notify").dismiss({ silent = true, pending = true })
	end, {
		desc = "Dismiss all Notifications",
	})
end

return {
	"rcarriga/nvim-notify",
	enabled = false,
	config = config,
	keys = {
		mapkey("<leader>nd", "<CMD>NotificationsDismiss<CR>", "n", { desc = "Dismiss all Notifications" }),
		mapkey("<leader>nh", "<CMD>Telescope notify<CR>", "n", { desc = "Show all Notifications (Telescope)" }),
	},
}
