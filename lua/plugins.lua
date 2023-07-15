local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
  use { "ellisonleao/gruvbox.nvim" }
  -- use "sainnhe/gruvbox-material"

  -- treesitter
  use(
      'nvim-treesitter/nvim-treesitter',
      {run = ':TSUpdate'}
  )
  use {'nvim-treesitter/playground'}

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  --tabs
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- undotree
  use {'mbbill/undotree'}

  -- vimfugitive
  use {'tpope/vim-fugitive'}

  -- lsp
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
              pcall(vim.cmd, 'MasonUpdate')
            end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'hrsh7th/cmp-path'},
          {'L3MON4D3/LuaSnip'},     -- Required
          {'saadparwaiz1/cmp_luasnip'},
          { "rafamadriz/friendly-snippets" },
      }
  }
  use {'folke/lsp-colors.nvim'}
  use { "ray-x/lsp_signature.nvim" }
  use {'simrat39/rust-tools.nvim'}
  use {'simrat39/inlay-hints.nvim'}
  use {'p00f/clangd_extensions.nvim'}
  use {'hood/popui.nvim'}

  -- LaTeX
  use 'lervag/vimtex'

  -- error lens
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

  -- Auto format tools
  use({ "sbdchd/neoformat", cmd = { "Neoformat" } })
  use { 'mhartington/formatter.nvim' }

  -- show and trim trailing whitespaces
  use {'jdhao/whitespace.nvim', event = 'VimEnter'}

  -- colors!
  use { 'norcalli/nvim-colorizer.lua' }

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
  use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})

  -- Plugin to manipulate character pairs quickly
  use({"machakann/vim-sandwich", event = "VimEnter"})

  -- lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

  -- auto-close pairs
  use({"Raimondi/delimitMate", event = "InsertEnter"})

  -- vimwiki
  use {'vimwiki/vimwiki'}

  -- indentline
  -- use {'Yggdroot/indentLine'}
  use "lukas-reineke/indent-blankline.nvim"

  -- tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
