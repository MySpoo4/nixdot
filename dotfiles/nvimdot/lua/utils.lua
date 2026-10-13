local default_opts = {
	noremap = true,
	silent = true,
}

--- @param opts (table|nil)
--- @return table
local get_opts = function(opts)
	local all_opts = opts
	if all_opts == nil then
		all_opts = {}
	end
	for k, v in pairs(default_opts) do
		all_opts[k] = all_opts[k] or v
	end
	return all_opts
end

--- @param keymaps string String
--- @param command (string|function) String|function
--- @param vimmode (string|table)
--- @param options (table|nil)
--- @return nil
local mapkey = function(keymaps, command, vimmode, options)
	local lhs = keymaps
	local rhs = command
	local opts = get_opts(options)
	vim.keymap.set(vimmode, lhs, rhs, opts)
end

return { mapkey = mapkey }
