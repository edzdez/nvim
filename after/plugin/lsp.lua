require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
})

local cmp = require('cmp')
local cmp_sources = {
    { name = 'path' }, { name = 'nvim_lsp' }, { name = 'luasnip', keyword_length = 2 }
}
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            })
        })
    },
    sources = cmp_sources,
    completion = { completeopt = 'menu,menuone,noinsert,noselect,preview' },
    experimental = { ghost_text = true }
})

-- lsp.set_sign_icons({
--     error = ' ',
--     warn = ' ',
--     hint = ' ',
--     info = ' '
-- })

function attach(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

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
end

require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = { border = "rounded" },
    toggle_key = "<C-K>"
}, bufnr)

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require('lspconfig')
lspconfig.ocamllsp.setup({ on_attach = attach })
lspconfig.lua_ls.setup({ on_attach = attach })
lspconfig.texlab.setup({ on_attach = attach })

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
    server = { on_attach = attach, standalone = true }
})

require('clangd_extensions').setup { server = { on_attach = attach } }

vim.diagnostic.config({ virtual_text = true })

require('lean').setup {
    abbreviations = { builtin = true },
    lsp = { on_attach = attach },
    lsp3 = { on_attach = attach },
    mappings = true
}

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local kopts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', ' cx',
    [[<Cmd>:lua vim.diagnostic.open_float(nil, {focus = false})<CR>]],
    kopts)

require("mason-null-ls").setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
    },
    automatic_installation = false,
    handlers = {}
})
require("null-ls").setup({
    sources = {
        -- Anything not supported by mason.
    }
})
