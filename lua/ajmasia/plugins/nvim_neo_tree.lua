return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, reveal_force_cwd = true })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
			{
				"<leader>E",
				function()
					require("neo-tree.command").execute({ action = "close" })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
			{
				"<leader>ge",
				function()
					require("neo-tree.command").execute({ toggle = true, source = "git_status" })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
			{
				"<leader>be",
				function()
					require("neo-tree.command").execute({ toggle = true, source = "buffers" })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
		},
	},
}
