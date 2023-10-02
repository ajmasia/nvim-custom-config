local opt = vim.opt -- for conciseness
--
-- set leader key to space
vim.g.mapleader = " "

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- sets the number of column spaces for a tab character
opt.shiftwidth = 2 -- sets the number of spaces for each indent level
opt.expandtab = true -- converts tab characters into spaces
opt.autoindent = true -- copy indent from current line when starting new on

-- line wrapping
opt.wrap = false -- disable line wrapping

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- swaping
opt.swapfile = false -- disble swap files

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- appearance
opt.termguicolors = true -- true color support
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

-- undo persistence
opt.undofile = true -- Enables persistent undo, which saves undo history to a file
opt.undolevels = 10000 -- Sets the maximum number of changes that can be undone

opt.shortmess:append({ W = true, I = true, c = true })
