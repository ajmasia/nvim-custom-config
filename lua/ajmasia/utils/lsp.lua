local M = {}

local lazy_utils = require("lazy.core.util")

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

local function remove_underscores(str)
	return str:gsub("_", "")
end

local servers_icons = {
	inactive = "",
	luals = "",
	tsserver = "",
	cssls = "",
	emmetls = "",
	html = "",
	marksman = "",
}

M.get_attached_servers = function(msg)
	msg = msg or ""

	---@diagnostic disable-next-line: missing-parameter, deprecated
	local buf_clients = vim.lsp.buf_get_clients()

	if next(buf_clients) == nil then
		if type(msg) == "boolean" or #msg == 0 then
			return ""
		end

		return msg
	end

	local buf_client_names = {}
	local copilot_active = false

	-- add client
	for _, client in pairs(buf_clients) do
		if client.name ~= "copilot" then
			local client_name = remove_underscores(client.name)

			table.insert(buf_client_names, servers_icons[client_name])
		end

		-- if client.name == "copilot" then
		-- 	copilot_active = true
		-- end
	end

	local unique_client_names = vim.fn.uniq(buf_client_names)
	local language_servers = table.concat(unique_client_names, " ") .. " "

	-- copilot status
	-- if copilot_active then
	-- 	language_servers = language_servers .. "%#SLCopilot#" .. " " .. "" .. " %*"
	-- end

	return language_servers
end

return M
