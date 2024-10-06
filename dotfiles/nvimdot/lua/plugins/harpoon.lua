local mapkey = require("util.keymapper").mapkey

local config = function()
	local harpoon = require("harpoon")

	mapkey("<leader>ha", function()
		harpoon:list():add()
	end, "n", { desc = "Add to Harpoon" })

	mapkey("<leader>hh", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, "n", { desc = "Toggle Harpoon Menu" })

	mapkey("<leader>1", function()
		harpoon:list():select(1)
	end, "n", { desc = "Harpoon 1" })

	mapkey("<leader>2", function()
		harpoon:list():select(2)
	end, "n", { desc = "Harpoon 2" })

	mapkey("<leader>3", function()
		harpoon:list():select(3)
	end, "n", { desc = "Harpoon 3" })

	mapkey("<leader>4", function()
		harpoon:list():select(4)
	end, "n", { desc = "Harpoon 4" })
end

-- return {}
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = config,
}
