return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup()

    require("mason-tool-installer").setup({
      ensure_installed = {
        "lua-language-server",
        "prettier",
        "stylua", -- lua formatter
      },
    })
  end,
}
