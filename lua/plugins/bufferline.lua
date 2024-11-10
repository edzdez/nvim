return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        show_tab_indicators = true,
        indicator = {
          style = "icon",
        },
        diagnostics = "nvim_lsp",
      },
      highlights = {
        indicator_selected = {
          fg = "#83a59a",
        },
      },
    })

    vim.keymap.set("n", "gt", "<cmd>BufferLineCycleNext<cr>", { remap = true, desc = "Next Buffer" })
    vim.keymap.set("n", "gT", "<cmd>BufferLineCyclePrev<cr>", { remap = true, desc = "Previous Buffer" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close Buffer" })
  end,
}
