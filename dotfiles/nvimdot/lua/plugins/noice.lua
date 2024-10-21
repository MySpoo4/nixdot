local mapkey = require("util.keymapper").mapkey

local config = function()
	require("noice").setup({
		cmdline = {
			view = "cmdline",
			format = {
				cmdline = false,
				search_down = { icon = "🔍⌄" },
				search_up = { icon = "🔍⌃" },
				filter = { icon = "$" },
				lua = { icon = "☾" },
				help = false,
			},
		},
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			signature = {
				auto_open = {
					throttle = 100, -- delay longer
				},
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		views = {
			-- for signature and doc
			hover = {
				border = {
					style = "single",
				},
				size = {
					-- prevents window from being to wide
					max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.6),
					-- prevents window from being to tall
					max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.6),
				},
			},
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
	})

	-- Lsp Hover Doc Scrolling
	mapkey("<C-f>", function()
		if not require("noice.lsp").scroll(4) then
			return "<C-f>"
		end
	end, { "n", "i", "s" }, { desc = "Scroll Doc Down" })

	mapkey("<C-d>", function()
		if not require("noice.lsp").scroll(-4) then
			return "<C-d>"
		end
	end, { "n", "i", "s" }, { desc = "Scroll Doc Up" })
end

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = config,
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
