require("bufferline").setup{}

vim.api.nvim_set_keymap('n', 'gt', [[<Cmd>BufferLineCycleNext<CR>]], {})
vim.api.nvim_set_keymap('n', 'gT', [[<Cmd>BufferLineCyclePrev<CR>]], {})
vim.api.nvim_set_keymap('n', '<leader>bd', [[<Cmd>bd<CR>]], {})
