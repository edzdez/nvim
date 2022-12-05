require('nvim-tree').setup({
    diagnostics = {
        enable = true,
    },
})

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', ' tt',
    [[<Cmd>:silent NvimTreeToggle<CR>]],
    kopts)

