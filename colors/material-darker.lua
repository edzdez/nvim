vim.g.colors_name = "material-darker"

require('config.colorscheme').setup({
    base00 = '#212121',
    base01 = '#292929',
    base02 = '#404040',
    base03 = '#616161',
    base04 = '#727272',
    base05 = '#b0bec5',
    base06 = '#eeffff',
    base07 = '#ffffff',
    base08 = '#eeffff',
    base09 = '#f78c6c',
    base0A = '#ffcb6b',
    base0B = '#c3e88d',
    base0C = '#89ddff',
    base0D = '#82aaff',
    base0E = '#c792ea',
    base0F = '#ff5370',
})

vim.cmd('highlight! link TSParameter TSAnnotation')
vim.cmd('highlight! link TSOperator TSStringEscape')
vim.cmd('highlight! link TSPunctDelimiter TSOperator')
vim.cmd('highlight! link TSNamespace TSType')
vim.cmd('highlight! link TSFuncMacro TSFunction')

vim.cmd('highlight! DiagnosticError ctermfg=1 guifg=#ff5370')
vim.cmd('highlight! DiagnosticWarn  ctermfg=3 guifg=#ffcb6b')
vim.cmd('highlight! DiagnosticInfo  ctermfg=4 guifg=#82aaff')
vim.cmd('highlight! link DiagnosticUnderlineError DiagnosticError')
vim.cmd('highlight! link DiagnosticUnderlineWarn DiagnosticWarn')
vim.cmd('highlight! link DiagnosticUnderlineInfo DiagnosticInfo')
