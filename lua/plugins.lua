-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

local packer = require('packer')
return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Time tracking
  use 'wakatime/vim-wakatime'

  -- File browser
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use {
    'notjedi/nvim-rooter.lua',
    config = function() require 'nvim-rooter'.setup() end
  }

  -- File finder
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --
  -- GIT integration
  use { 'NeogitOrg/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim' } }
  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  --
  -- Language Server stuff
  use 'neovim/nvim-lspconfig'
  -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"

  use {
    'hrsh7th/nvim-cmp',
    -- event = 'InsertEnter',
    -- config = [[require('config.cmp')]]
  }

  -- autopairs for neovim written by lua
  use {
    "windwp/nvim-autopairs",
    after = 'nvim-cmp',
    config = function()
      require("nvim-autopairs").setup {}
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  }

  --
  -- Test runner
  use "jfpedroza/neotest-elixir"
  use "nvim-neotest/neotest-vim-test"
  use "antoinemadec/FixCursorHold.nvim"
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-vim-test",
      "antoinemadec/FixCursorHold.nvim"
    }
  }

  -- Adds start screen with cow
  use 'mhinz/vim-startify'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use "ray-x/lsp_signature.nvim"

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- Show code context
  use 'nvim-treesitter/nvim-treesitter-context'

  --
  -- General usability
  --
  -- easily search for, substitute, and abbreviate multiple variants of a word
  use 'tpope/vim-abolish'

  -- Easy text exchange operator for Vim (cx)
  use 'tommcdo/vim-exchange'

  -- Commenting support (gc)
  use 'tpope/vim-commentary'

  --[e and ]e exchange the current line with the one above or below
  use 'tpope/vim-unimpaired'

  -- dot repeat last command
  use 'tpope/vim-repeat'

  -- quoting/parenthesizing made simple
  use 'tpope/vim-surround'

  -- In project navigation
  use 'tpope/vim-projectionist'


  -- Elixir integration
  use {
    "elixir-tools/elixir-tools.nvim",
    tag = "stable",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- Colorschemes
  -- You can alias plugin names
  use { 'karoliskoncevicius/moonshine-vim', as = 'moonshine' }
  use { 'sainnhe/gruvbox-material' }
  -- use 'AlexvZyl/nordic.nvim'
  -- use 'sainnhe/everforest'
  -- update()
end)

-- -- WhichKey is a popup with possible key bindings
-- use {
--   "folke/which-key.nvim",
--   config = function()
--     vim.o.timeout = true
--     vim.o.timeoutlen = 300
--     require("which-key").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     }
--   end
-- }
