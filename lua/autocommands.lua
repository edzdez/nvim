vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- vim.cmd[[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost * FormatWrite
-- augroup END
-- ]]
