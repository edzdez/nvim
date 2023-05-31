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
  disable_netrw = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
})


local kopts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>fe', [[<Cmd>NvimTreeToggle<CR>]], kopts)
