local M = {}

---@class opts string|table
---@field src? string URL of the plugin
---@field name? string Name of the plugin
---@field version? string Version of the plugin
---@field pre_hook? function Executed before the plugin is installed
---@field post_hook? function Executed after the plugin is installed
M.addplug = function(opts)

	if type(opts) == "string" then
		vim.pack.add({opts}, {confirm = false})
		return
	end

	if opts.pre_hook then
		opts.pre_hook()
	end

	if opts.name and not opts.version then
		vim.pack.add({{src = opts.src, name = opts.name}}, { confirm = false })
	elseif opts.version and not opts.name then
		vim.pack.add({{src = opts.src, version = vim.version.range(opts.version) }}, { confirm = false })
	elseif opts.name and opts.version then
		vim.pack.add({{src = opts.src, name = opts.name, version = vim.version.range(opts.version) }}, { confirm = false })
	else
		vim.pack.add({opts.src}, { confirm = false })
	end

	if opts.post_hook then
		opts.post_hook()
	end
end

return M
