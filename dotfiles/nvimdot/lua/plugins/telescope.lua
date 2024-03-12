local mapkey = require("util.keymapper").mapkey

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
          ["<C-d>"] = "delete_buffer",
				},
        n = {
          ["dd"] = "delete_buffer",
        },
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = false,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		mapkey("<leader>fk", "<CMD>Telescope keymaps<CR>", "n"),
		mapkey("<leader>fh", "<CMD>Telescope help_tags<CR>", "n"),
		mapkey("<leader>ff", "<CMD>Telescope find_files<CR>", "n"),
		mapkey("<leader>fg", "<CMD>Telescope live_grep<CR>", "n"),
		mapkey("<leader>fb", "<CMD>Telescope buffers<CR>", "n"),
	},
}
