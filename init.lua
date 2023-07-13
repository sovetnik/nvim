require 'plugins'

vim.cmd [[ :PackerUpdate ]]

require 'config.absolute'
require 'config.completion'
require 'config.elixir'
require 'config.gitsign'
require 'config.lsp'
require 'config.neotest'
require 'config.signature'
require 'config.statusline'
require 'config.telescope'
require 'config.tree'
require 'config.treesitter'
require 'mappings.core'
require 'mappings.leader'

vim.cmd [[
  syntax enable
  colorscheme moonshine
  highlight Comment ctermfg=143 cterm=NONE
  highlight Search ctermbg=237 ctermfg=190
  highlight IncSearch ctermbg=237 ctermfg=154 cterm=underline
  au BufWritePost *.ex,*.exs,*.heex,*.lua lua vim.lsp.buf.format()
  au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=700}
]]
