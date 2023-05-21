require("bufferline").setup{}

vim.api.nvim_set_keymap('n', 'bt', [[BufferLineCycleNext<CR>]], {})
vim.api.nvim_set_keymap('n', 'bT', [[BufferLineCyclePrev<CR>]], {})
vim.api.nvim_set_keymap('n', '<leader>bd', [[:bd<CR>]], {})
