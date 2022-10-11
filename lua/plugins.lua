return require("packer").startup(function()
    -- it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Base 16 themes
    use 'RRethy/nvim-base16'
    -- Material themes
    use {
        'kaicataldo/material.vim',
        config = function()
            -- cmd('set termguicolors')

            vim.g.material_terminal_italics = 1
            vim.g.material_theme_style = 'community-darker'
        end
    }

    -- nvim tree
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = [[require('config.nvim-tree')]],
    }

    use({"onsails/lspkind-nvim", event = "VimEnter"})
    -- auto-completion engine
    use {"hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]]}

    use { 'williamboman/nvim-lsp-installer' }
    use 'folke/lsp-colors.nvim'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- nvim-cmp completion sources
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    use { "hrsh7th/cmp-omni", after = "nvim-cmp" }

    use({"SirVer/ultisnips", event = 'InsertEnter'})
    use({ "honza/vim-snippets", after = 'ultisnips'})
    use {"hrsh7th/cmp-cmdline", after = "nvim-cmp"}
    use {"quangnguyen30192/cmp-nvim-ultisnips", after = {'nvim-cmp', 'ultisnips'}}

    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp')]] }
    use { 'p00f/clangd_extensions.nvim' }
    use { 'simrat39/rust-tools.nvim' }
    use { 'kovisoft/slimv' }

    use { 'nvim-lua/plenary.nvim' }
    use { 'mfussenegger/nvim-dap' }

    use { "nvim-treesitter/nvim-treesitter", event = 'BufEnter', run = ":TSUpdate", config = [[require('config.treesitter')]] }
    use { 'nvim-treesitter/playground' }
    use { "ray-x/lsp_signature.nvim" }

    use { 'Olical/conjure' }

    -- Auto format tools
    use({ "sbdchd/neoformat", cmd = { "Neoformat" } })

    -- show and trim trailing whitespaces
    use {'jdhao/whitespace.nvim', event = 'VimEnter'}

    -- colors!
    use { 'norcalli/nvim-colorizer.lua' }

    -- showing keybindings
    use {"folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function() require('config.which-key') end, 2000)
    end
    }

    -- The missing auto-completion for cmdline!
    use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})

    -- Session management plugin
    use({"tpope/vim-obsession", cmd = 'Obsession'})
    use({"ojroques/vim-oscyank", cmd = {'OSCYank', 'OSCYankReg'}})

    use({ "cespare/vim-toml", ft = { "toml" }, branch = "main" })

    use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })

    -- Add indent object for vim (useful for languages like Python)
    use({"michaeljsmith/vim-indent-object", event = "VimEnter"})

    -- Plugin to manipulate character pairs quickly
    use({"machakann/vim-sandwich", event = "VimEnter"})

    -- Markdown JSON header highlight plugin
    use({ "elzr/vim-json", ft = { "json", "markdown" } })

    -- Vim tabular plugin for manipulate tabular, required by markdown plugins
    use({ "godlygeek/tabular", cmd = { "Tabularize" } })

    -- Another markdown plugin
    use({ "plasticboy/vim-markdown", ft = { "markdown" } })

    -- Git command inside vim
    use({ "tpope/vim-fugitive", event = "User InGitRepo" })

    use({ "akinsho/bufferline.nvim", event = "VimEnter", config = [[require('config.bufferline')]] })

    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      config = [[require('config.statusline')]]
    }

    use { 'airblade/vim-gitgutter' }

    use {
      'nvim-telescope/telescope.nvim', cmd = 'Telescope',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- search emoji and other symbols
    use {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}

    use {
      'kevinhwang91/nvim-hlslens',
      branch = 'main',
      keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
      config = [[require('config.hlslens')]]
    }

    -- auto-close pairs
    use({"Raimondi/delimitMate", event = "InsertEnter"})

    -- use { 'RRethy/vim-illuminate' }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use { 'dag/vim-fish' }
    -- use {
    --     "lukas-reineke/indent-blankline.nvim",
    --     config = function()
    --         require("indent_blankline").setup {
    --             -- for example, context is off by default, use this to turn it on
    --             show_current_context = true,
    --             show_current_context_start = true,
    --         }
    --     end
    -- }

    use {
        'Yggdroot/indentLine',
    }

    use { 'vimwiki/vimwiki' }

    use {
        'hood/popui.nvim',
        requires = "RishabhRD/popfix",
        config = function()
            vim.ui.select = require"popui.ui-overrider"
            -- vim.ui.input = require"popui.ui-overrider"

            local kopts = {noremap = true, silent = true}

            vim.api.nvim_set_keymap('n', ' cd',
                [[<Cmd>:lua require'popui.diagnostics-navigator'()<CR>]],
                kopts)
        end
    }

    use { 'igankevich/mesonic' }

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require"catppuccin".setup {
                transparent_background = false,
                term_colors = false,
                styles = {
                	comments = "italic",
                	conditionals = "italic",
                	loops = "NONE",
                	functions = "NONE",
                	keywords = "NONE",
                	strings = "NONE",
                	variables = "NONE",
                	numbers = "NONE",
                	booleans = "NONE",
                	properties = "NONE",
                	types = "NONE",
                	operators = "NONE",
                },
                integrations = {
                	treesitter = true,
                	native_lsp = {
                		enabled = true,
                		virtual_text = {
                			errors = "italic",
                			hints = "italic",
                			warnings = "italic",
                			information = "italic",
                		},
                		underlines = {
                			errors = "underline",
                			hints = "underline",
                			warnings = "underline",
                			information = "underline",
                		},
                	},
                    coc_nvim = false,
                	lsp_trouble = true,
                	cmp = true,
                	lsp_saga = false,
                	gitgutter = true,
                	gitsigns = true,
                	telescope = true,
                	nvimtree = {
                		enabled = true,
                		show_root = true,
                		transparent_panel = false,
                	},
                	neotree = {
                		enabled = false,
                		show_root = false,
                		transparent_panel = false,
                	},
                	which_key = false,
                	indent_blankline = {
                		enabled = true,
                		colored_indent_levels = false,
                	},
                	dashboard = true,
                	neogit = false,
                	vim_sneak = false,
                	fern = false,
                	barbar = false,
                	bufferline = true,
                	markdown = true,
                	lightspeed = false,
                	ts_rainbow = false,
                	hop = false,
                	notify = true,
                	telekasten = true,
                	symbols_outline = true,
                }}
        end
    }
end)


