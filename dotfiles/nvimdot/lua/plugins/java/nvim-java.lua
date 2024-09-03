return {
	"nvim-java/nvim-java",
	config = function()
		require("java").setup()
		require("lspconfig").jdtls.setup({
			handlers = {
				["language/status"] = function(_, result) end,
				["$/progress"] = function(_, result) end,
			},
		})
	end,
}
