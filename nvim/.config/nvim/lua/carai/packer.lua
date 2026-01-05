-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- themes
  --use({
  --  "blazkowolf/gruber-darker.nvim",
  --  as = 'gruber-darker',
  --  config = function()
  --    vim.cmd('colorscheme gruber-darker')
  --  end
  --})
  --use({
  --  "ellisonleao/gruvbox.nvim",
  --  as = 'gruvbox',
  --  config = function()
  --    vim.cmd('set background=dark')
  --    vim.cmd('colorscheme gruvbox')
  --  end
  --})
  use({
    "miikanissi/modus-themes.nvim",
    as = 'modus',
    config = function()
      vim.cmd('set background=dark')
      vim.cmd('colorscheme modus')
    end
  })

  use('nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate'

  })
  use 'nvim-treesitter/nvim-treesitter-context'
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }
  use('neovim/nvim-lspconfig')
  -- use('nvimtools/none-ls.nvim')
  -- use('MunifTanjim/prettier.nvim')
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-orgmode/orgmode'
  -- use 'github/copilot.vim'
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use "stevearc/oil.nvim"
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  }
  use "sindrets/diffview.nvim"

  -- clojure
  --  use "tpope/vim-dispatch"
  --  use "clojure-vim/vim-jack-in"
  --  use "radenling/vim-dispatch-neovim"

  --  use "Olical/conjure"
  use {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  }

  use "stevearc/conform.nvim"


  --use {
  --  "monkoose/neocodeium",
  --  config = function()
  --    local neocodeium = require("neocodeium")

  --    neocodeium.setup({
  --      debounce = true,
  --      filetypes = {
  --        TelescopePrompt = false,
  --        ["dap-repl"] = false,
  --      },
  --    })
  --    vim.keymap.set("i", "<right>", neocodeium.accept)
  --  end,
  --}
end)
