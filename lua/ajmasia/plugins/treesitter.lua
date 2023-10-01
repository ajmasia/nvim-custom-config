return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	enabled = true,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = {
			"lua",
			"luadoc",
			"vim",
			"vimdoc",
			"query",
			"nix",
			"bash",
			"typescript",
			"javascript",
			"tsx",
			"html",
			"css",
			"astro",
			"json",
			"yaml",
			"python",
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		autotag = { enable = true },
		context_commentstring = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					-- this keymap permit select objects based on tree-sitter parser
					["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region" },
					["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region" },

					["a:"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/field region" },
					["i:"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/field region" },

					["ag"] = { query = "@comment.outer", desc = "Select outer part of a comment" },
					["ig"] = { query = "@comment.inner", desc = "Select inner part of a comment" },

					["ac"] = { query = "@conditional.outer", desc = "Select outer part of a conditional region" },
					["ic"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },

					["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },
					["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },

					["ab"] = { query = "@block.outer", desc = "Select outer part of a block region" }, -- overrides default text object block of parenthesis to parenthesis
					["ib"] = { query = "@block.inner", desc = "Select inner part of a block region" }, -- overrides default text object block of parenthesis to parenthesis

					["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
					["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
				},
				include_surrounding_whitespace = false,
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>on"] = "@parameter.inner", -- swap object under cursor with next
				},
				swap_previous = {
					["<leader>op"] = "@parameter.inner", -- swap object under cursor with previous
				},
			},
		},
	},
}
