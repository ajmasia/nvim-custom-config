local M = {}

local lazy_utils = require "lazy.core.util"

local diagnostic_enabled = true
M.toggle_diagnostics = function()
	diagnostic_enabled = not diagnostic_enabled
	if diagnostic_enabled then
		vim.diagnostic.enable()
		lazy_utils.info("Enabled diagnostics", { title = "Diagnostics" })
	else
		vim.diagnostic.disable()
		lazy_utils.warn("Disabled diagnostics", { title = "Diagnostics" })
	end
end

return M
