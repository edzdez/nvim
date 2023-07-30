vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<leader>cf',
    [[<Cmd>:lua vim.lsp.buf.format()<CR>]],
    {})

