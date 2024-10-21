local config = function()
	local cmp = require("cmp")

	local function format(_, item)
		local MAX_LABEL_WIDTH = math.floor(vim.api.nvim_win_get_width(0) * 0.4)
		local MIN_LABEL_WIDTH = 10
		local ELLIPSIS = "..."
		local function whitespace(max, len)
			return (" "):rep(max - len)
		end

		-- Limit content width.
		local content = item.abbr
		local truncated = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH)
		if truncated ~= content then
			item.abbr = truncated .. ELLIPSIS
		elseif string.len(content) < MIN_LABEL_WIDTH then
			item.abbr = content .. whitespace(MIN_LABEL_WIDTH, #content)
		end

		-- Remove gibberish.
		item.menu = nil
		return item
	end

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,preview,noselect",
		},
		-- snippet = { -- configure how nvim-cmp interacts with snippet engine
		-- 	expand = function(args)
		-- 		luasnip.lsp_expand(args.body)
		-- 	end,
		-- },
		window = {
			completion = cmp.config.window.bordered({
				scrollbar = true,
				border = "single",
				side_padding = 0,
			}),
			documentation = cmp.config.window.bordered({
				scrollbar = true,
				border = "single",
				side_padding = 1,
				max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.4),
				max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.5),
			}),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }), -- previous suggestion
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }), -- next suggestion
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
			["<C-e>"] = cmp.mapping.abort(), -- close completion window
			["<CR>"] = cmp.mapping.confirm({ select = false }),
		}),
		-- sources for autocompletion
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "buffer" }, -- text within current buffer
			{ name = "path" }, -- file system paths
		}),
		formatting = {
			fields = { "abbr", "kind" },
			format = format,
		},
		performance = {
			-- debounce = 100,
			max_view_entries = 10,
		},
	})

	-- `/` cmdline setup.
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- `:` cmdline setup.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
			},
		}),
	})
end

return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdLineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline", -- source for cmd line cmp
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = config,
}
