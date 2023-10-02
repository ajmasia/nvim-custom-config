return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
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
        lualine_a = {
          { "mode", upper = true }
        },
        lualine_b = {
          { "branch", icon = "" },
        },
        lualine_c = {
          {
            "diff",
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
          },
          { "filename", file_status = true, path = 0 }
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = {
              error = " ", warn = " ", hint = "󰠠 ", info = " "
            }
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
