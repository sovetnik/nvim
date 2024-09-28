require 'plugins'

require 'config.absolute'
require 'config.colorscheme'
require 'config.completion'
require 'config.elixir'
require 'config.gitsign'
require 'config.lsp'
require 'config.neogit'
require 'config.neotest'
require 'config.signature'
require 'config.statusline'
require 'config.telescope'
require 'config.tree'
require 'config.treesitter'
require 'mappings.core'
require 'mappings.leader'

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
  end,
})
