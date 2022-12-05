local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', ' ff',
    [[<Cmd>:silent Telescope find_files<CR>]],
    kopts)

vim.api.nvim_set_keymap('n', ' fr',
    [[<Cmd>:silent Telescope oldfiles<CR>]],
    kopts)

vim.api.nvim_set_keymap('n', ' fb',
    [[<Cmd>:silent Telescope buffers<CR>]],
    kopts)

vim.api.nvim_set_keymap('n', ' fi',
    [[<Cmd>:silent Telescope lsp_references<CR>]],
    kopts)

vim.api.nvim_set_keymap('n', ' fd',
    [[<Cmd>:silent Telescope lsp_definitions<CR>]],
    kopts)

vim.api.nvim_set_keymap('n', ' fm',
    [[<Cmd>:silent Telescope man_pages<CR>]],
    kopts)

-- Lua
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
