function attach(client, bufnr)
  require("lsp_signature").on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = { border = "single" },
    toggle_key = "<C-K>",
  }, bufnr)

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration (LSP)" })
  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, { buffer = bufnr, desc = "Go to Definition (LSP)" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation (LSP)" })

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, { buffer = bufnr, desc = "Hover (LSP)" })
  vim.keymap.set("i", "<C-k>", function()
    vim.lsp.buf.signature_help()
  end, { buffer = bufnr, desc = "Show Signature (LSP)" })

  vim.keymap.set(
    "n",
    "<leader>wa",
    vim.lsp.buf.add_workspace_folder,
    { buffer = bufnr, desc = "Add Folder to Workspace (LSP)" }
  )
  vim.keymap.set(
    "n",
    "<leader>wr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, desc = "Remove Folder from Workspace (LSP)" }
  )

  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol (LSP)" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action (LSP)" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Find References (LSP)" })
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "ray-x/lsp_signature.nvim",
    "p00f/clangd_extensions.nvim",
    "simrat39/rust-tools.nvim",
    "simrat39/inlay-hints.nvim",
    "Julian/lean.nvim",
    "whonore/Coqtail",
  },
  config = function()
    local lsp = require("lspconfig")

    lsp.hls.setup({ on_attach = attach })
    lsp.ocamllsp.setup({ on_attach = attach })
    lsp.lua_ls.setup({ on_attach = attach })
    lsp.ltex.setup({ on_attach = attach })
    lsp.texlab.setup({ on_attach = attach })
    lsp.pyright.setup({ on_attach = attach })
    lsp.gopls.setup({ on_attach = attach })
    lsp.elixirls.setup({ on_attach = attach })
    lsp.zls.setup({ on_attach = attach })
    lsp.clangd.setup({
      on_attach = function(client, bufnr)
        attach(client, bufnr)
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
      end,
    })

    local rust_tools = require("rust-tools")
    rust_tools.setup({
      tools = {
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
          auto = true,
          only_current_line = false,
          show_parameter_hints = true,
          highlight = "Comment",
        },
      },
      server = { on_attach = attach, standalone = true },
    })

    vim.diagnostic.config({ virtual_text = true })
    require("clangd_extensions").setup({
      inlay_hints = {
        inline = vim.fn.has("nvim-0.10") == 1,
        -- Options other than `highlight' and `priority' only work
        -- if `inline' is disabled
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refresh of the inlay hints.
        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = { "CursorHold" },
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "⊶ ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "⊷ ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100,
      },
    })

    require("lean").setup({
      abbreviations = { builtin = true },
      lsp = { on_attach = attach },
      lsp3 = { on_attach = attach },
      mappings = true,
    })
  end,
}
