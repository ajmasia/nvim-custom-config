local lsp_utils = require("ajmasia.utils.lsp")

local keymap = vim.keymap -- for conciseness

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

keymap.set("n", "<leader>ud", lsp_utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })

-- formatting
keymap.set({ "n", "v" }, "<leader>cf", function()
  require("lazyvim.plugins.lsp.format").format({ force = true })
end, { desc = "Format" })

-- lazygit
map("n", "<leader>gg",
  function() require "ajmasia.utils".float_term({ "lazygit" },
      { cwd = require "ajmasia.utils".get_root(), esc_esc = false, ctrl_hjkl = false })
  end,
  { desc = "Lazygit (root dir)" })
map("n", "<leader>gG",
  function() require "ajmasia.utils".float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false }) end,
  { desc = "Lazygit (cwd)" })

-- floating terminal
local nvim_term = function() require "ajmasia.utils".float_term(nil, { cwd = require "ajmasia.utils".get_root() }) end

map("n", "<leader>ft", nvim_term, { desc = "Terminal (root dir)" })
map("n", "<leader>fT", function() require "ajmasia.utils".float_term() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", nvim_term, { desc = "Terminal (root dir)" })
map("n", "<c-_>", nvim_term, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
