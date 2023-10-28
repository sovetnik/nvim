require 'plugins'

vim.cmd [[ :PackerUpdate ]]

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

vim.cmd [[
  au BufWritePost *.ex,*.exs,*.heex,*.lua lua vim.lsp.buf.format()
  au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=700}
]]
