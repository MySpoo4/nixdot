local config = function()
	local cmp = require("cmp")

	local luasnip = require("luasnip")

	local lspkind = require("lspkind")

	-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,preview,noselect",
		},
		snippet = { -- configure how nvim-cmp interacts with snippet engine
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
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
			{ name = "luasnip" }, -- snippets
			{ name = "buffer" }, -- text within current buffer
			{ name = "path" }, -- file system paths
		}),
		-- configure lspkind for vs-code like pictograms in completion menu
		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
			}),
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
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = config,
}
