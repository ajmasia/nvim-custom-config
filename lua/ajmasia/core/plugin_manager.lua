-- Plugin manager settings https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, 'lazy')

if not ok then
  print("ERROR: An error occurred while loading the plugin manager: " .. lazy)
else
  lazy.setup {
    spec = {
      -- import/override defined plugins
      { import = "ajmasia.plugins" },
      { import = "ajmasia.plugins.lsp" }
    },
    checker = {
      -- automatically check for plugin updates
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  }
end
