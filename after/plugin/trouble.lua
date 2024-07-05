require("trouble").setup {}

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",
    { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>",
    { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>",
    { silent = true, noremap = true })

require("todo-comments").setup {}
