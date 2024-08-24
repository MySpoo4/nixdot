local config = function()
	local bufferline = require("bufferline")
	bufferline.setup({
		options = {
			mode = "buffers", -- set to "tabs" to only show tabpages instead
			style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
			numbers = "none",
			close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
			right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				style = "icon",
			},
			buffer_close_icon = "󰅖",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			--- name_formatter can be used to change the buffer's label in the bufferline.
			--- Please note some names can/will break the
			--- bufferline so use this at your discretion knowing that it has
			--- some limitations that will *NOT* be fixed.
			max_name_length = 18,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			truncate_names = true, -- whether or not tab names should be truncated
			tab_size = 18,
			diagnostics = "nvim_lsp",
			color_icons = true, -- whether or not to add the filetype icon highlights
			get_element_icon = function(element)
				-- element consists of {filetype: string, path: string, extension: string, directory: string}
				-- This can be used to change how bufferline fetches the icon
				-- for an element e.g. a buffer or a tab.
				-- e.g.
				local icon, hl =
					require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
				return icon, hl
			end,
			show_buffer_icons = true, -- disable filetype icons for buffers
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			move_wraps_at_ends = true, -- whether or not the move command "wraps" at the first or last position
			always_show_bufferline = false,
			-- can also be a table containing 2 custom separators
			-- [focused and unfocused]. eg: { '|', '|' }
			enforce_regular_tabs = false,
			sort_by = "insert_at_end",
		},
	})

	function bufremove(buf)
		buf = buf or 0
		buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

		if vim.bo.modified then
			local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
			if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
				return
			end
			if choice == 1 then -- Yes
				vim.cmd.write()
			end
		end

		for _, win in ipairs(vim.fn.win_findbuf(buf)) do
			vim.api.nvim_win_call(win, function()
				if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
					return
				end
				-- Try using alternate buffer
				local alt = vim.fn.bufnr("#")
				if alt ~= buf and vim.fn.buflisted(alt) == 1 then
					vim.api.nvim_win_set_buf(win, alt)
					return
				end

				-- Try using previous buffer
				local has_previous = pcall(vim.cmd, "bprevious")
				if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
					return
				end

				-- Create new listed buffer
				local new_buf = vim.api.nvim_create_buf(true, false)
				vim.api.nvim_win_set_buf(win, new_buf)
			end)
		end
		if vim.api.nvim_buf_is_valid(buf) then
			pcall(vim.cmd, "bdelete! " .. buf)
		end
	end

	vim.keymap.set("n", "<leader>bd", bufremove, { desc = "Delete Buffer" })
end

return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {},
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = config,
}
