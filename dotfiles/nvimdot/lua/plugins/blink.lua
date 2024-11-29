-- remove draw funciton and see if it includes function signature
local config = function()
	local draw = function(ctx)
		local width = math.floor(vim.api.nvim_win_get_width(0) * 0.4)
		return {
			" ",
			{
				ctx.kind_icon,
				ctx.icon_gap,
				hl_group = ("BlinkCmpKind" .. ctx.kind),
			},
			{
				ctx.item.label,
				fill = true,
				hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
				max_width = width,
			},
			" ",
		}
	end

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
		-- accept = { auto_brackets = { enabled = true } },
		trigger = { signature_help = { enabled = true } },
		windows = {
			autocomplete = {
				min_width = 1,
				max_height = 10,
				selection = "manual",
				border = "single",
				draw = draw,
				-- draw = {
				-- 	components = {
				-- 		label = {
				-- 			width = { fill = true, max = 25 },
				-- 		},
				-- 		label_description = {
				-- 			width = { max = 20 },
				-- 		},
				-- 	},
				-- },
			},
			documentation = {
				max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
				max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.5),
				border = "single",
			},
			signature_help = {
				max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.5),
				max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.4),
				border = "single",
			},
		},
	})

	-- For setting right colors for cmp window
	vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "NormalFloat" })
	vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
	vim.api.nvim_set_hl(0, "BlinkCmpLabel", { link = "None" })
	vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { link = "Visual" })
end

return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	config = config,
}
