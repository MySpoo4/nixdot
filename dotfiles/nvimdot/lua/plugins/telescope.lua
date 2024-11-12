local mapkey = require("util.keymapper").mapkey

local config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	telescope.setup({
		defaults = require("telescope.themes").get_ivy({
			preview = false,
			layout_config = {
				height = 0.30,
			},
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					-- TODO Telescope key remapping
					-- ["<C-q>"] = actions.close,
				},
				n = {
					["<leader>fq"] = actions.send_to_qflist + actions.open_qflist,
					["q"] = actions.close,
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
			buffers = {
				initial_mode = "normal",
				sort_mru = true,
				mappings = {
					i = {
						["<C-d>"] = "delete_buffer",
					},
					n = {
						["dd"] = "delete_buffer",
					},
				},
			},
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
