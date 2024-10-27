return {
  "stevearc/conform.nvim",
  branch = "nvim-0.9",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
     formatters_by_ft = {
       css = { "prettier" },
       html = { "prettier" },
       json = { "prettier" },
       yaml = { "prettier" },
       markdown = { "prettier" },
       lua = { "stylua" },
     },
     format_on_save = {
       lsp_fallback = true,
       async = false,
       timeout_ms = 1000,
     },
  }
}