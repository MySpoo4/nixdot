local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "qf",
	callback = function()
		local height = math.floor(vim.o.lines * 0.25)
		vim.cmd("resize" .. height)
	end,
})
