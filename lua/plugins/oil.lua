return {
  "stevearc/oil.nvim",
  keys = {
    {
      "<leader>fe",
      "<cmd>Oil<cr>",
      desc = "Files (Oil)"
    },
  },
  config = function()
    require("oil").setup()
  end
}
