return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
    })

    vim.cmd("hi GitSignsAdd guifg=#b8bb26 guibg=#3c3836")
    vim.cmd("hi GitSignsChange guifg=#fe8019 guibg=#3c3836")
    vim.cmd("hi GitSignsDelete guifg=#fb4934 guibg=#3c3836")
    vim.cmd("hi GitSignsUntracked guifg=#b8bb26 guibg=#3c3836")
  end,
}
