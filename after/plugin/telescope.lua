local builtin = require('telescope.builtin')

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
