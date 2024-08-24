local config = function()
	require("oil").setup({
		use_default_keymaps = false,
		keymaps = {
			["<ENTER>"] = "actions.select",
			["g."] = "actions.toggle_hidden",
			["<C-p>"] = "actions.preview",
			["<ESC>"] = {
				function()
					if vim.o.filetype == "oil" then
						require("oil").discard_all_changes()
						require("oil").close()
					end
				end,
				mode = "n",
				nowait = true,
				desc = "Close oil, discarding changes",
			},
		},
	})

	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
}
