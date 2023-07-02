-- lvim/ftplugin/tex.lua
vim.cmd("call vimtex#init()")

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_enabled = 1

-- Don't open QuickFix for warning messages if no errors are present
vim.g.vimtex_quickfix_open_on_warning = 0


vim.g.vimtex_compiler_latexmk_engines = {
    ['_']                = "-lualatex",
    ['pdfdvi']           = "-pdfdvi",
    ['pdfps']            = "-pdfps",
    ['pdflatex']         = "-pdf",
    ['luatex']           = "-lualatex",
    ['lualatex']         = "-lualatex",
    ['xelatex']          = "-xelatex",
    ['pdftex']           = "-pdf -pdflatex=pdftex",
    ['xetex']            = "-pdf -pdflatex=xetex",
    ['luatex']           = "-pdf -pdflatex=luatex",
    ['context (pdftex)'] = "-pdf -pdflatex=texexec",
    ['context (luatex)'] = "-pdf -pdflatex=context",
    ['context (xetex)']  = "-pdf -pdflatex=''texexec --xtx''"
}
