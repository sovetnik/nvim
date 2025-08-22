local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



-- Define plugins with lazy loading
local plugins = {
  -- Time tracking
  { 'wakatime/vim-wakatime' },

  -- File browser
  { "nvim-lua/plenary.nvim" },
  {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  },

  -- Ensure plenary.nvim is loaded for elixir-tools.nvim
  {
    "elixir-tools/elixir-tools.nvim",
    tag = "stable",
    requires = { "nvim-lua/plenary.nvim" }
  },

  -- File browser
  {
    'nvim-tree.lua',
    requires = { 'nvim-tree-devicons.lua' }
  },
  {
    'notjedi/nvim-rooter.lua',
    config = function() require 'nvim-rooter'.setup() end
  },

  -- File finder
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  {
    'nvim-telescope/telescope.nvim',
    requires = { 'plenary.nvim', 'telescope-fzf-native.nvim' }
  },
  { 'jonarrien/telescope-cmdline.nvim' },

  -- GIT integration
  {
    'NeogitOrg/neogit',
    requires = { 'plenary.nvim', 'diffview.nvim' }
  },
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'plenary.nvim' }
  },

  -- Language Server stuff
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },

  -- Autocompletion + snippets
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    after = 'nvim-cmp',
    config = function()
      require("nvim-autopairs").setup {}
    end
  },

  -- Test runner
  { "vim-test/vim-test" },
  { "nvim-neotest/nvim-nio" },
  { "jfpedroza/neotest-elixir" },
  { "olimorris/neotest-rspec" },
  { "nvim-neotest/neotest-vim-test" },
  { "antoinemadec/FixCursorHold.nvim" },
  {
    "nvim-neotest/neotest",
    commit = "52fca67",
    requires = { "nvim-neotest/nvim-nio", "nvim-neotest/neotest-vim-test", "plenary.nvim", "antoinemadec/FixCursorHold.nvim" }
  },

  -- Adds start screen with cow
  { 'mhinz/vim-startify' },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-web-devicons', opt = true }
  },
  { "ray-x/lsp_signature.nvim" },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

  { 'rgroli/other.nvim' },

  -- General usability
  { 'tpope/vim-abolish' },
  { 'tommcdo/vim-exchange' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-projectionist' },
  { 'tpope/vim-rails' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-unimpaired' },

  -- CodeCompanion
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- Elixir integration
  {
    "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "plenary.nvim" } },
  { 'emmanueltouzery/elixir-extras.nvim' },

  -- Colorschemes
  { 'RRethy/nvim-base16' }
}

require("lazy").setup(plugins)
require("lazy").update()
