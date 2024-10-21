local config = function()
	require("mini.pairs").setup({
		modes = { insert = true, command = true, terminal = false },
	})
end

return {
	"echasnovski/mini.pairs",
	event = "VeryLazy",
	config = config,
}
