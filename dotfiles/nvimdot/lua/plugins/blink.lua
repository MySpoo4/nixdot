local config = function()
	require("blink.cmp").setup({
		keymap = {
			["<CR>"] = { "accept", "fallback" },
			["<C-e>"] = { "hide" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-d>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},

			menu = {
				border = "single",
				scrollbar = false,
				max_height = 10,
				draw = {
					columns = { { "kind_icon" }, { "label" } },

					components = {
						label = {
							text = function(ctx)
								return ctx.label .. " " .. ctx.label_detail
							end,

							highlight = function(ctx)
								-- label and label details
								local highlights = {
									{
										0,
										#ctx.label,
										group = "BlinkCmpLabel",
									},
								}
								if ctx.label_detail then
									table.insert(highlights, {
										#ctx.label + 1,
										#ctx.label + 1 + #ctx.label_detail,
										group = "BlinkCmpLabelDetail",
									})
								end

								-- characters matched on the label by the fuzzy matcher
								for _, idx in ipairs(ctx.label_matched_indices) do
									table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
								end

								return highlights
							end,
						},
					},
				},
			},
			documentation = {
				window = { border = "single" },
				auto_show = false,
			},
		},

		signature = {
			enabled = true,
			window = {
				show_documentation = false,
				border = "single",
			},
		},

		cmdline = {
			keymap = {
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "show", "select_next" },
				["<C-e>"] = { "hide" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
			},
			completion = { menu = { auto_show = false } },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "rust" },
	})
end

return {
	"saghen/blink.cmp",
	-- enabled = false,
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	config = config,
}
