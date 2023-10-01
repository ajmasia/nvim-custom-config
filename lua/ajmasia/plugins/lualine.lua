return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "alpha", "dashboard", "TelescopePrompt", "mason" },
				},
			},
			extensions = { "neo-tree", "lazy" },
			sections = {
				lualine_a = { { "mode", upper = true } },
				lualine_b = { { "branch", icon = "" }, "db_ui#statusline" },
				lualine_c = { { "filename", file_status = true, path = 1 } },
				lualine_x = {
					"diagnostics",
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
					{
						require("ajmasia.utils.lsp").get_attached_servers,
					},
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "ff9e64" },
					},
				},
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}
