local copilot = function()
  local Util = require("ajmasia.utils")
  local colors = {
    [""] = Util.fg("Special"),
    ["Normal"] = Util.fg("Special"),
    ["Warning"] = Util.fg("DiagnosticError"),
    ["InProgress"] = Util.fg("DiagnosticWarn"),
  }
  return {
    function()
      local icon = " "
      local status = require("copilot.api").status.data
      return icon .. (status.message or "")
    end,

    cond = function()
      local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
      return ok and #clients > 0
    end,

    color = function()
      if not package.loaded["copilot"] then
        return
      end
      local status = require("copilot.api").status.data
      return colors[status.status] or colors[""]
    end,
  }
end

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
          copilot(),
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
