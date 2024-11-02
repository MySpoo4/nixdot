local config = function()
	require("fidget").setup()
end

return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	config = config,
}
