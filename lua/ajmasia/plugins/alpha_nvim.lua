return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons", "BlakeJC94/alpha-nvim-fortune" },
	config = function()
		local alpha = require("alpha")
		local if_nil = vim.F.if_nil
		local logo = [[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
      ]]
		local leader = "SPC"

		local function button(sc, txt, keybind, keybind_opts)
			local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

			local opts = {
				position = "center",
				shortcut = sc,
				cursor = 5,
				width = 40,
				align_shortcut = "right",
				hl_shortcut = "Keyword",
			}

			if keybind then
				keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_, keybind, keybind_opts }
			end

			local function on_press()
				local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
				vim.api.nvim_feedkeys(key, "t", false)
			end

			return {
				type = "button",
				val = txt,
				on_press = on_press,
				opts = opts,
			}
		end

		local buttons = {
			type = "group",
			val = {
				button("p", " " .. " Projects", ":Telescope projects <CR>"),
				button("f", " " .. " Find file", ":Telescope find_files <CR>"),
				button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
				button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
				button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
				-- button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
				button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
			},
			opts = {
				spacing = 1,
			},
		}
		local fortune = require("alpha.fortune")

		local config = {
			layout = {
				{ type = "padding", val = 6 },
				{
					type = "terminal",
					command = "cmatrix -r -u 8",
					width = 60,
					height = 8,
					opts = {
						redraw = true,
						window_config = {},
					},
				},
				{ type = "padding", val = 2 },
				{ type = "text", val = logo, opts = { position = "center" }, height = 5 },
				buttons,
				{ type = "text", val = fortune, opts = { position = "center", hl = "Type" }, height = 5 },
			},
			opts = {
				noautocmd = false,
			},
		}

		require("alpha.term")

		alpha.setup(config)
	end,
}
