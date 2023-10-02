local lsp_utils = require("ajmasia.utils.lsp")

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>ud", lsp_utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })

-- formatting
keymap.set({ "n", "v" }, "<leader>cf", function()
  require("lazyvim.plugins.lsp.format").format({ force = true })
end, { desc = "Format" })

