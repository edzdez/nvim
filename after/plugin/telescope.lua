local builtin = require('telescope.builtin')

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<leader>ff',
                        [[<Cmd>:silent Telescope find_files<CR>]], kopts)
vim.api.nvim_set_keymap('n', '<leader>fr',
                        [[<Cmd>:silent Telescope oldfiles<CR>]], kopts)
vim.api.nvim_set_keymap('n', '<leader>fb',
                        [[<Cmd>:silent Telescope buffers<CR>]], kopts)
vim.api.nvim_set_keymap('n', '<leader>fi',
                        [[<Cmd>:silent Telescope lsp_references<CR>]], kopts)
vim.api.nvim_set_keymap('n', '<leader>fd',
                        [[<Cmd>:silent Telescope lsp_definitions<CR>]], kopts)
vim.api.nvim_set_keymap('n', '<leader>fm',
                        [[<Cmd>:silent Telescope man_pages<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<leader>fz',
                        [[<Cmd>:silent Telescope current_buffer_fuzzy_find<CR>]],
                        kopts)

vim.api.nvim_set_keymap('n', '<leader>fs',
                        [[<Cmd>:silent Telescope lsp_dynamic_workspace_symbols<CR>]],
                        kopts)

vim.api.nvim_set_keymap('n', '<leader>ft',
                        [[<Cmd>:silent Telescope treesitter<CR>]], kopts)
