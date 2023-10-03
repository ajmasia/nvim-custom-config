local taskColor = "#d7d7d7"
local titleColor = "#FFBF00"

vim.cmd('highlight FidgetTitle guifg=' .. titleColor)
vim.cmd('highlight FidgetTask guifg=' .. taskColor)

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
