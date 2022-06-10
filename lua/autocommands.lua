vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = { "*.rs", "*.cpp", "*.h", "*.hpp" },
    -- callback = function() vim.lsp.buf.formatting_sync(nil, 200) end,
    command = "Neoformat",
})

vim.api.nvim_create_autocmd({"TextYankPost"}, {
    pattern = "*",
    callback = function() vim.highlight.on_yank({timeout=300, on_visual=false}) end,
})

