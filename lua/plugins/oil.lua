return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    {
      "<leader>fe",
      "<cmd>Oil<cr>",
      desc = "Files (Oil)",
    },
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
    })
  end,
}
