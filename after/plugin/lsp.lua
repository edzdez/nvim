local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

local select_opts = {behavior = cmp.SelectBehavior.select}

local cmp_sources = {
    {name = 'path'}, {name = 'nvim_lsp'}, {name = 'luasnip', keyword_length = 2}
}

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Tab>'] = cmp.mapping.select_next_item(select_opts),
        ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp_sources,
    completion = {completeopt = 'menu,menuone,noinsert,noselect,preview'},
    experimental = {ghost_text = true},
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end}
})

-- lsp.set_sign_icons({
--     error = ' ',
--     warn = ' ',
--     hint = ' ',
--     info = ' '
-- })

function attach(client, bufnr)
    local bufopts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end,
                   opts)
    vim.keymap.set("n", "<leader>vd",
                   function() vim.diagnostic.open_float() end, opts)

    vim.keymap.set("n", "<leader>vws",
                   function() vim.lsp.buf.workleader_symbol() end, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
                   bufopts)

    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<leader>bp', require'dap'.toggle_breakpoint, bufopts)
    vim.keymap.set('n', '<leader>sO', require'dap'.step_over, bufopts)
    vim.keymap.set('n', '<leader>si', require'dap'.step_into, bufopts)
    vim.keymap.set('n', '<leader>so', require'dap'.step_out, bufopts)
    vim.keymap.set('n', '<leader>sr', require'dap'.continue, bufopts)
    vim.keymap.set('n', '<leader>ro', require'dap'.repl.open, bufopts)
end

require"lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {border = "rounded"},
    toggle_key = "<C-K>"
}, bufnr)

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require('lspconfig')
lspconfig.ocamllsp.setup({on_attach = attach})
lspconfig.lua_ls.setup({on_attach = attach})
lspconfig.texlab.setup({on_attach = attach})
lspconfig.pyright.setup({on_attach = attach})
lspconfig.dafny.setup({on_attach = attach})
lspconfig.gopls.setup({on_attach = attach})
lspconfig.elixirls.setup({on_attach = attach})
lspconfig.zls.setup({on_attach = attach})
lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        attach(client, bufnr)
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
    end
})

local rust_tools = require('rust-tools')
rust_tools.setup({
    tools = {
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            highlight = "Comment"
        }
    },
    server = {on_attach = attach, standalone = true}
})

vim.diagnostic.config({virtual_text = true})
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
        only_current_line_autocmd = {"CursorHold"},
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
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
        priority = 100
    }
})

require('lean').setup {
    abbreviations = {builtin = true},
    lsp = {on_attach = attach},
    lsp3 = {on_attach = attach},
    mappings = true
}

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local kopts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', ' cx',
                        [[<Cmd>:lua vim.diagnostic.open_float(nil, {focus = false})<CR>]],
                        kopts)
