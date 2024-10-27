return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find Files (Telescope)",
    },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Recent Files (Telescope)",
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers (Telescope)",
    },
    {
      "<leader>fci",
      "<cmd>Telescope lsp_references<cr>",
      desc = "Lsp References (Telescope)",
    },
    {
      "<leader>fcs",
      "<cmd>Telescope lsp_workspace_symbols<cr>",
      desc = "Lsp Symbols (Telescope)",
    },
    {
      "<leader>fcd",
      "<cmd>Telescope diagnostics<cr>",
      desc = "Lsp Diagnostics (Telescope)",
    },
    {
      "<leader>fct",
      "<cmd>Telescope treesitter<cr>",
      desc = "Treesitter (Telescope)",
    },
    {
      "<leader>fz",
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      desc = "Fuzzy Find (Telescope)",
    },
    {
      "<leader>fm",
      "<cmd>Telescope man_pages<cr>",
      desc = "Man Pages (Telescope)",
    },
    {
      "<leader>fj",
      "<cmd>Telescope jumplist<cr>",
      desc = "Jump List (Telescope)",
    },
    {
      "<leader>fg",
      "<cmd>Telescope live_grep<cr>",
      desc = "Live Grep (Telescope)",
    },
  },
  config = function()
    require("telescope").setup()

    local builtin = require("telescope.builtin")
  end,
}
