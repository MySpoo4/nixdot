local mapkey = require("util.keymapper").mapkey

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = require("telescope.themes").get_dropdown({
			preview = false,
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<C-q>"] = "close",
				},
				n = {
					["q"] = "close",
				},
			},
		}),
		pickers = {
			find_files = {
				hidden = true,
			},
			live_grep = {
				previewer = true,
			},
			buffers = require("telescope.themes").get_ivy({
				initial_mode = "normal",
				layout_config = {
					height = 0.30,
				},
				mappings = {
					i = {
						["<C-d>"] = "delete_buffer",
					},
					n = {
						["dd"] = "delete_buffer",
					},
				},
			}),
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	config = config,
	keys = {
		mapkey("<leader>fk", "<CMD>Telescope keymaps<CR>", "n"),
		mapkey("<leader>fh", "<CMD>Telescope help_tags<CR>", "n"),
		mapkey("<leader>ff", "<CMD>Telescope find_files<CR>", "n"),
		mapkey("<leader>fg", "<CMD>Telescope live_grep<CR>", "n"),
		mapkey("<leader>fb", "<CMD>Telescope buffers<CR>", "n"),
	},
}
