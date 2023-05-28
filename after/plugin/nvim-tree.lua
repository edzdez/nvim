require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


local kopts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>ft', [[<Cmd>NvimTreeToggle<CR>]], kopts)
