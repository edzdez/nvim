-- TODO: oil
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Base 16 themes
    use {'RRethy/nvim-base16'}
    -- use {'chriskempson/base16-vim'}

    -- Gruvbox
    use {"ellisonleao/gruvbox.nvim"}
    -- use "sainnhe/gruvbox-material"

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use {'nvim-treesitter/playground'}

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- tabs
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- undotree
    use {'mbbill/undotree'}

    -- vimfugitive
    use {'tpope/vim-fugitive'}

    -- lsp
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-path'}
    use {'L3MON4D3/LuaSnip'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {"rafamadriz/friendly-snippets"}
    use {"ray-x/lsp_signature.nvim"}
    use {'simrat39/rust-tools.nvim'}
    use {'simrat39/inlay-hints.nvim'}
    use {'p00f/clangd_extensions.nvim'}
    use {'hood/popui.nvim'}
    use {'Julian/lean.nvim'}
    use {'whonore/Coqtail'}

    -- surround
    use {
        'kylechui/nvim-surround',
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }

    -- multicursor
    use 'mg979/vim-visual-multi'

    -- dap
    use 'mfussenegger/nvim-dap'
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use 'nvim-neotest/nvim-nio'

    -- LaTeX
    use 'lervag/vimtex'

    -- error lens
    use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use {"folke/todo-comments.nvim"}

    -- Auto format tools
    use({"sbdchd/neoformat", cmd = {"Neoformat"}})

    -- show and trim trailing whitespaces
    use {'jdhao/whitespace.nvim', event = 'VimEnter'}

    -- colors!
    use {'norcalli/nvim-colorizer.lua'}

    -- which-key
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- The missing auto-completion for cmdline!
    use({
        "gelguy/wilder.nvim",
        opt = true,
        setup = [[vim.cmd('packadd wilder.nvim')]]
    })

    -- Plugin to manipulate character pairs quickly
    use({"machakann/vim-sandwich", event = "VimEnter"})

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true}
    }

    -- auto-close pairs
    use({"Raimondi/delimitMate", event = "InsertEnter"})

    -- vimwiki
    use {'vimwiki/vimwiki'}

    -- indentline
    -- use {'Yggdroot/indentLine'}
    use {
        "lukas-reineke/indent-blankline.nvim",
        -- FIXME: undo breaking change
        commit = '3d08501caef2329aba5121b753e903904088f7e6'

    }

    use {"stevearc/oil.nvim"}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require('packer').sync() end
end)
