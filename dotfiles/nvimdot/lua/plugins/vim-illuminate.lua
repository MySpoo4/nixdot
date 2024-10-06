local config = function()
	require("illuminate").configure({})
end

return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	config = config,
}
