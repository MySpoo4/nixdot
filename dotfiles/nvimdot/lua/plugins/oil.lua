local config = function()
	require("oil").setup({})
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

	local close = function()
		if vim.o.filetype == "oil" then
			require("oil").discard_all_changes()
			require("oil").close()
		end
	end

	vim.keymap.set("n", "<ESC>", close, { desc = "Close Oil" })
end

return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
}
