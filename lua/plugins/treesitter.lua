return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.3",
  dependecies = {
    "nvim-treesitter/playground",
  },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
