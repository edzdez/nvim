vim.g.powerline_loaded = 1 -- stop screaming, powerline!

vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.hidden = true -- allows for hidden buffers
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false -- disable mode above statusline
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes" -- diagnostics next to line
vim.opt.pumheight = 50 -- autocomplete menu height

-- tabs
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- wrap/scroll
vim.opt.wrap = false
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8

-- swap/undo/backup
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.backup = false

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
