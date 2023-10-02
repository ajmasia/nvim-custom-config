return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason
		mason.setup({
			-- define here custom settings for mason
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				-- "lua_ls", this server do not works with NixOS. Plase install directly in your system
				"emmet_ls",
				"rnix",
        "eslint"
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				-- "stylua", this server do not works with NixOS. Plase install directly in your system
				"eslint_d",
			},
		})
	end,
}
