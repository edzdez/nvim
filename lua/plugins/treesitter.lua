return {
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/playground",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("treesitter.configs")

    treesitter.setup({
      ensure_installed = "maintained",
      sync_install = false,
      auto_install = true,

      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
