local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

-- misc
opt.joinspaces = true
opt.fileencoding = "utf-8"
opt.termguicolors = true
opt.hidden = true
opt.clipboard = "unnamedplus"
opt.showmode = false
opt.mouse = "a"
opt.signcolumn = "yes"
opt.pumheight = 10
opt.updatetime = 250
-- these should be in after/plugin/indentline.lua
-- vim.opt.concealcursor = "nc" -- don't conceal when cursor is on line in insert mode
-- vim.cmd("let g:indentLine_fileTypeExclude = ['markdown']") -- indentline don't conceal!
g.powerline_loaded = 1 -- necessary to get powerline to stop screaming at me

-- tabs
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- highlight
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- split
opt.splitbelow = true
opt.splitright = true

-- wrap/scroll
opt.wrap = false
opt.scrolloff = 4
opt.sidescrolloff = 8

-- swap/undo/backup
opt.swapfile = false
opt.undofile = true
opt.backup = false

-- disable netrw for nvimtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vimwiki
g.vimwiki_list = {
    {
        path_html = '~/vimwiki/html',
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
        custom_wiki2html = '~/.local/bin/wiki2html.sh',
        template_path = "~/.local/share/nvim/site/pack/packer/start/vimwiki/autoload/vimwiki"
    }
}

-- colorscheme
-- vim.cmd("colorscheme base16-tomorrow-night")
-- vim.cmd("highlight MatchParen ctermbg=242 guibg=#373b41")
vim.cmd [[colorscheme gruvbox]]
vim.cmd [[ set rtp^="/home/ethan/.opam/default/share/ocp-indent/vim" ]]
