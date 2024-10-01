local config = function()
	require("notify").setup({
		timeout = 3000,
		render = "wrapped-compact",
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.5)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	})

	vim.cmd("set noshowmode")
end

return {
	"rcarriga/nvim-notify",
	keys = {
		{
			"<leader>un",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss all Notifications",
		},
		{
			"<leader>uh",
			"<CMD>Telescope notify<CR>",
			desc = "Show all Notifications (Telescope)",
		},
	},
	config = config,
}
