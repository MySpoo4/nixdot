local config = function()
	local nvim_autopairs = require("nvim-autopairs")
	nvim_autopairs.setup({
		check_ts = true,
		map_cr = true, --  map <CR> on insert mode
		map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
		auto_select = false, -- auto select first item
		map_char = {
			-- modifies the function or method delimiter by filetypes
			all = "(",
			tex = "{",
		},
	})
end

return {
	"windwp/nvim-autopairs",
	event = { "BufReadPre", "BufNewFile" },
	config = config,
}
