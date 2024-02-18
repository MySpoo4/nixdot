return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
		local which_key = require("which-key")

		which_key.setup({
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			window = {
				border = "shadow",
				position = "bottom",
				margin = { 0, 1, 1, 5 },
				padding = { 1, 2, 1, 2 },
			},
			triggers_nowait = {
				"`",
				"'",
				"g`",
				"g'",
				'"',
				"<c-r>",
				"z=",
			},
		})

		local opts = {
			prefix = "<leader>",
		}

		local groups = {
      e = { name = "nvim-tree" },
      s = { name = "split" },
      f = { name = "find" },
      b = { name = "buffers" },
			["<tab>"] = { name = "tabs" },
			[";"] = { name = "test" },
			["'"] = { name = "marks" },
			["/"] = { name = "search" },
			["/g"] = { name = "git" },
			["/gd"] = { name = "diff" },
			["["] = { name = "previous" },
			["]"] = { name = "next" },
		}

		which_key.register(groups, opts)
	end,
}
