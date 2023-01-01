local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

g.mapleader = " "
g.maplocalleader = "\\"

opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.joinspaces = true

opt.splitbelow = true
opt.splitright = true

opt.wrap = false
opt.scrolloff = 4
opt.sidescrolloff = 8

opt.fileencoding = "utf-8"
opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.hidden = true

opt.swapfile = false
opt.undofile = true
opt.backup = false

opt.clipboard = "unnamedplus"

opt.fileencoding = "utf-8"

opt.showmode = false
opt.mouse = "a"

opt.signcolumn = "yes"

opt.pumheight = 10

opt.updatetime = 250

cmd('set concealcursor-=in')

g.vimwiki_list = {
    {
        path_html = '~/vimwiki/html',
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
        custom_wiki2html = '~/.local/bin/wiki2html.sh',
        template_path = "~/.local/share/nvim/site/pack/packer/start/vimwiki/autoload/vimwiki",
    }
}

g.indentLine_concealcursor = ''

g.powerline_loaded = 1

-- cmd('colorscheme base16-material-darker')
-- cmd('colorscheme material-darker')
-- cmd('colorscheme material')
vim.cmd[[colorscheme base16-tomorrow-night]]
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- vim.cmd[[colorscheme catppuccin]]
vim.cmd[[let g:UltiSnipsExpandTrigger = '<c-j>']]
