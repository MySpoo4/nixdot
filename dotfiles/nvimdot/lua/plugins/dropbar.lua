local config = function()
	local dropbar = require("dropbar")

	local custom_source = function(buf, _)
		local sources = require("dropbar.sources")
		local utils = require("dropbar.utils")

		local filename = {
			get_symbols = function(buff, win, cursor)
				local symbols = sources.path.get_symbols(buff, win, cursor)
				return { symbols[#symbols] }
			end,
		}

		if vim.bo[buf].ft == "markdown" then
			return {
				filename,
				sources.markdown,
			}
		end
		if vim.bo[buf].buftype == "terminal" then
			return {
				sources.terminal,
			}
		end
		return {
			filename,
			utils.source.fallback({
				sources.lsp,
				sources.treesitter,
			}),
		}
	end

	dropbar.setup({
		general = {
			update_interval = 100,
		},
		bar = {
			sources = custom_source,
		},
	})

	vim.keymap.set("n", "<leader>wb", function()
		require("dropbar.api").pick()
	end)
end

return {
	"Bekaboo/dropbar.nvim",
	config = config,
}
